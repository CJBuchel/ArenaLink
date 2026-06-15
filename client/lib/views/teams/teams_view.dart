import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/models/pit_alert.dart';
import 'package:arena_link/providers/arena_provider.dart';
import 'package:arena_link/providers/issue_provider.dart';
import 'package:arena_link/providers/settings_provider.dart';
import 'package:arena_link/views/field_monitor/widgets/station_state.dart' show IssueStatus;
import 'package:arena_link/services/alert_service.dart' show postAlert;
import 'package:arena_link/widgets/pit_alert_dialog.dart';
import 'package:arena_link/widgets/ticket_history_sheet.dart';
import 'package:arena_link/views/teams/match_log_screen.dart';

// ─── Teams view ───────────────────────────────────────────────────────────────

class TeamsView extends HookConsumerWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arena     = ref.watch(arenaProvider);
    final statusMap = ref.watch(teamStatusMapProvider);
    final settings  = ref.watch(appSettingsProvider);
    final query     = useState('');

    final teams = arena.teams;

    final filtered = useMemoized(() {
      if (query.value.isEmpty) return teams;
      final q = query.value.toLowerCase();
      return teams
          .where((t) =>
              t.id.toString().contains(q) ||
              t.name.toLowerCase().contains(q) ||
              t.nickname.toLowerCase().contains(q))
          .toList();
    }, [teams, query.value]);

    return Column(
      children: [
        _Header(query: query, teamCount: teams.length),
        const Divider(height: 1, color: surfaceBorder),
        Expanded(
          child: teams.isEmpty
              ? _EmptyState(
                  serverConnected: arena.connection == BackendConnectionStatus.connected,
                  fmsConnected:    arena.fmsConnected,
                )
              : filtered.isEmpty
                  ? Center(
                      child: Text(
                        'No teams match "${query.value}"',
                        style: const TextStyle(color: labelDim, fontSize: 13),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      itemCount: filtered.length,
                      itemBuilder: (context, i) {
                        final team     = filtered[i];
                        final ts       = statusMap[team.id];
                        final status   = ts?.$1 ?? IssueStatus.none;
                        final openCount = ts?.$2 ?? 0;

                        return _TeamTile(
                          team: team,
                          issueStatus: status,
                          openCount: openCount,
                          onFlag: () async {
                            final field = arena.field;
                            final ctx = PitAlertContext.fromTeam(
                              team: team,
                              matchName: field?.matchName ?? '',
                              matchTypeLabel: field != null
                                  ? _matchTypeLabel(field.matchType)
                                  : '',
                            );
                            final sub = await showPitAlertDialog(context, ctx);
                            if (sub != null && context.mounted) {
                              await postAlert(settings, sub);
                            }
                          },
                          onHistory: () => showTicketHistory(
                            context,
                            settings: settings,
                            teamId: team.id,
                            teamDisplay: _teamDisplay(team),
                          ),
                          onLogs: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MatchLogScreen(
                                team: team,
                                matchLog: arena.matchLog,
                                serverHost: settings.serverHost,
                                serverPort: settings.serverPort,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends HookWidget {
  final ValueNotifier<String> query;
  final int teamCount;

  const _Header({required this.query, required this.teamCount});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (v) => query.value = v,
              style: const TextStyle(fontSize: 13, color: labelFaint),
              decoration: InputDecoration(
                hintText: 'Search teams…',
                hintStyle: const TextStyle(color: labelDim, fontSize: 13),
                prefixIcon: const Icon(Icons.search_rounded,
                    size: 18, color: labelDim),
                suffixIcon: query.value.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close_rounded,
                            size: 16, color: labelDim),
                        onPressed: () {
                          controller.clear();
                          query.value = '';
                        },
                      )
                    : null,
                filled: true,
                fillColor: surfaceBar,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: surfaceBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: surfaceBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: arenaBlue, width: 1.5),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$teamCount teams',
            style: const TextStyle(fontSize: 11, color: labelDim),
          ),
        ],
      ),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final bool serverConnected;
  final bool fmsConnected;
  const _EmptyState({
    required this.serverConnected,
    required this.fmsConnected,
  });

  @override
  Widget build(BuildContext context) {
    final (String label, String? sub) = switch (true) {
      _ when !serverConnected => ('Not connected to ArenaLink server.', null),
      _ when !fmsConnected    => ('FMS not connected.', 'ArenaLink server is running but not connected to the FMS.'),
      _                       => ('No teams loaded yet.', 'Load a match on the field to populate teams.'),
    };

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.groups_rounded, size: 48, color: labelMuted),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(color: labelDim, fontSize: 13)),
          if (sub != null) ...[
            const SizedBox(height: 6),
            Text(sub, style: const TextStyle(color: labelMuted, fontSize: 11)),
          ],
        ],
      ),
    );
  }
}

// ─── Team tile ────────────────────────────────────────────────────────────────

class _TeamTile extends StatelessWidget {
  final EventTeam team;
  final IssueStatus issueStatus;
  final int openCount;
  final VoidCallback onFlag;
  final VoidCallback onHistory;
  final VoidCallback onLogs;

  const _TeamTile({
    required this.team,
    required this.issueStatus,
    required this.openCount,
    required this.onFlag,
    required this.onHistory,
    required this.onLogs,
  });

  @override
  Widget build(BuildContext context) {
    final (borderColor, _) = _statusAppearance(issueStatus);
    final hasBadge = issueStatus != IssueStatus.none;

    // Build location subtext
    final locationParts = [
      if (team.city.isNotEmpty) team.city,
      if (team.stateProv.isNotEmpty) team.stateProv,
      if (team.country.isNotEmpty) team.country,
    ];
    final location = locationParts.join(', ');
    final nickname = team.nickname.isNotEmpty ? team.nickname : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: surfaceBar,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: hasBadge
              ? borderColor.withValues(alpha: 0.45)
              : surfaceBorder,
          width: hasBadge ? 1.5 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            // ── Team number + info ─────────────────────────────────────────
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Team number badge
                  Container(
                    constraints: const BoxConstraints(minWidth: 56),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: hasBadge
                          ? borderColor.withValues(alpha: 0.12)
                          : surfaceIdle,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${team.id}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: hasBadge ? borderColor : labelFaint,
                            height: 1.1,
                          ),
                        ),
                        if (team.rank != null)
                          Text(
                            '#${team.rank}',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: hasBadge
                                  ? borderColor.withValues(alpha: 0.8)
                                  : arenaBlue,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Team name / nickname / location
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (nickname != null)
                              Flexible(
                                child: Text(
                                  nickname,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: labelFaint,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            else if (team.name.isNotEmpty)
                              Flexible(
                                child: Text(
                                  team.name,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: labelFaint,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            if (team.yellowCard) ...[
                              const SizedBox(width: 6),
                              const Icon(Icons.style_rounded,
                                  size: 13, color: arenaAmber),
                            ],
                          ],
                        ),
                        if (location.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            location,
                            style: const TextStyle(
                                fontSize: 10, color: labelMuted),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // ── Action buttons ─────────────────────────────────────────────
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Flag / alert button — lights up based on ticket status
                TeamActionButton(
                  icon: _flagIcon(issueStatus),
                  label: _flagLabel(issueStatus),
                  activeColor: _statusColor(issueStatus),
                  isActive: issueStatus != IssueStatus.none,
                  badge: openCount >= 1 ? openCount : null,
                  onTap: onFlag,
                ),
                const SizedBox(width: 6),
                // History button — lights up when there are any tickets
                TeamActionButton(
                  icon: Icons.history_rounded,
                  label: 'History',
                  activeColor: arenaBlue,
                  isActive: issueStatus != IssueStatus.none,
                  onTap: onHistory,
                ),
                const SizedBox(width: 6),
                // Match log button — always shown, no active state
                TeamActionButton(
                  icon: Icons.bar_chart_rounded,
                  label: 'Logs',
                  activeColor: arenaGreen,
                  isActive: false,
                  onTap: onLogs,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Generic reusable team action button ──────────────────────────────────────
//
// Used throughout the teams view. Can be reused in other views too.
// When [isActive] is true the button is lit with [activeColor].
// An optional [badge] integer shows a count overlay.

class TeamActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color activeColor;
  final bool isActive;
  final int? badge;
  final VoidCallback onTap;

  const TeamActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.activeColor,
    required this.isActive,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isActive
        ? activeColor.withValues(alpha: 0.15)
        : surfaceIdle;
    final fg = isActive ? activeColor : labelMuted;

    return Tooltip(
      message: label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isActive
                      ? activeColor.withValues(alpha: 0.35)
                      : surfaceBorder,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 18, color: fg),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: fg,
                    ),
                  ),
                ],
              ),
            ),
            if (badge != null && badge! > 1)
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: activeColor,
                    shape: BoxShape.circle,
                  ),
                  constraints:
                      const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '$badge',
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

(Color, IconData) _statusAppearance(IssueStatus s) => switch (s) {
  IssueStatus.flagged    => (arenaAmber, Icons.flag_rounded),
  IssueStatus.inProgress => (arenaBlue,  Icons.engineering_rounded),
  IssueStatus.resolved   => (arenaGreen, Icons.task_alt_rounded),
  IssueStatus.none       => (surfaceBorder, Icons.flag_outlined),
};

Color _statusColor(IssueStatus s) => switch (s) {
  IssueStatus.flagged    => arenaAmber,
  IssueStatus.inProgress => arenaBlue,
  IssueStatus.resolved   => arenaGreen,
  IssueStatus.none       => labelMuted,
};

IconData _flagIcon(IssueStatus s) => switch (s) {
  IssueStatus.flagged    => Icons.flag_rounded,
  IssueStatus.inProgress => Icons.engineering_rounded,
  IssueStatus.resolved   => Icons.task_alt_rounded,
  IssueStatus.none       => Icons.flag_outlined,
};

String _flagLabel(IssueStatus s) => switch (s) {
  IssueStatus.flagged    => 'Flagged',
  IssueStatus.inProgress => 'Active',
  IssueStatus.resolved   => 'Resolved',
  IssueStatus.none       => 'Flag',
};

String _teamDisplay(EventTeam t) {
  final name = t.nickname.isNotEmpty ? t.nickname : t.name;
  return name.isNotEmpty ? '${t.id} — $name' : '${t.id}';
}

String _matchTypeLabel(int matchType) => switch (matchType) {
  0 => 'Test',
  1 => 'Practice',
  2 => 'Qualification',
  3 => 'Playoff',
  _ => '',
};
