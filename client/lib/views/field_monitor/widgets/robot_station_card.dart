import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/models/pit_alert.dart';
import 'package:arena_link/providers/arena_provider.dart';
import 'package:arena_link/providers/issue_provider.dart';
import 'package:arena_link/providers/settings_provider.dart';
import 'package:arena_link/services/alert_service.dart';
import 'package:arena_link/views/field_monitor/widgets/conn_pill.dart';
import 'package:arena_link/views/field_monitor/widgets/station_state.dart';
import 'package:arena_link/widgets/pit_alert_dialog.dart';
import 'package:arena_link/widgets/ticket_history_sheet.dart';

// ─── Card style ───────────────────────────────────────────────────────────────

typedef _CardStyle = ({
  Color allianceColor,
  Color centerBg,
  Color dividerColor,
  Color borderColor,
  Color accentColor,
  Color barBg,
  bool showAccent,
});

_CardStyle _deriveCardStyle(StateDisplay state, Color baseAlliance) {
  final allianceColor = state.severity == StationSeverity.critical
      ? labelMuted
      : switch (state.allianceMode) {
          AllianceMode.active => baseAlliance,
          AllianceMode.dim    => labelMuted,
          AllianceMode.off    => labelOff,
        };
  final hasAlert = state.severity != StationSeverity.none;
  final accent   = state.color;
  return (
    allianceColor: allianceColor,
    centerBg:      allianceColor.withValues(alpha: 0.12),
    dividerColor:  allianceColor.withValues(alpha: 0.22),
    borderColor:   hasAlert
        ? accent.withValues(alpha: 0.55)
        : allianceColor.withValues(alpha: 0.40),
    accentColor:   accent,
    barBg:         surfaceBar,
    showAccent:    hasAlert,
  );
}

// ─── Icon tile ────────────────────────────────────────────────────────────────

class _IconTile extends StatelessWidget {
  final IconData icon;
  final String value;
  final ConnStatus status;
  final double iconSize;
  final double textSize;
  final bool showIcon;

  const _IconTile({
    required this.icon,
    required this.value,
    required this.status,
    this.iconSize = 15,
    this.textSize = 9,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = status.dot;
    final effectiveValueSize = showIcon ? textSize : textSize * 1.8;
    final gap = (iconSize * 0.10).clamp(0.5, 2.5);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showIcon) ...[
          Icon(icon, size: iconSize, color: color),
          SizedBox(height: gap),
        ],
        Text(
          value,
          style: TextStyle(
            fontSize: effectiveValueSize,
            fontWeight: FontWeight.w700,
            color: color,
            letterSpacing: 0.1,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}

// ─── Issue column ─────────────────────────────────────────────────────────────
// Shows the flag / WIP / resolved icon and is tappable to open the alert dialog.

class _IssueColumn extends StatelessWidget {
  final IssueStatus status;
  final Color allianceColor;
  final double centerH;
  final VoidCallback onTap;
  final int openCount;
  final VoidCallback? onHistoryTap;

  const _IssueColumn({
    required this.status,
    required this.allianceColor,
    required this.centerH,
    required this.onTap,
    this.openCount = 0,
    this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize   = (centerH * 0.22).clamp(12.0, 22.0);
    final labelSize  = (centerH * 0.09).clamp(7.0, 11.0);
    final badgeSize  = (iconSize * 0.52).clamp(10.0, 14.0);
    final badgeFontSize = (badgeSize * 0.55).clamp(6.0, 8.0);

    final (icon, color, label) = switch (status) {
      IssueStatus.flagged    => (Icons.flag_rounded,        arenaAmber, 'FLAG'),
      IssueStatus.inProgress => (Icons.engineering_rounded, arenaBlue,  'WIP'),
      IssueStatus.resolved   => (Icons.task_alt_rounded,    arenaGreen, 'DONE'),
      IssueStatus.none       => (
        Icons.flag_outlined,
        allianceColor.withValues(alpha: 0.25),
        '',
      ),
    };

    // History button color: bright when open tickets, dim when resolved history,
    // very faint when no history yet.
    final Color historyColor;
    if (openCount > 0) {
      historyColor = color; // matches the flag icon (amber / blue / green)
    } else if (status != IssueStatus.none) {
      historyColor = arenaGreen.withValues(alpha: 0.55); // resolved history
    } else if (onHistoryTap != null) {
      historyColor = labelMuted.withValues(alpha: 0.45); // team present, no history
    } else {
      historyColor = labelMuted.withValues(alpha: 0.15); // no team
    }
    final historyIconSize = (centerH * 0.14).clamp(13.0, 19.0);

    return Container(
      width: 40,
      color: allianceColor.withValues(alpha: 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── History button — pinned to top ──
          GestureDetector(
            onTap: onHistoryTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
              child: Icon(
                Icons.history_rounded,
                size: historyIconSize,
                color: historyColor,
              ),
            ),
          ),

          // ── Flag + badge — centred in remaining space ──
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(icon, size: iconSize, color: color),
                        if (openCount > 0)
                          Positioned(
                            top: -badgeSize * 0.35,
                            right: -badgeSize * 0.35,
                            child: Container(
                              width: badgeSize,
                              height: badgeSize,
                              decoration: const BoxDecoration(
                                color: arenaRed,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                openCount > 9 ? '9+' : '$openCount',
                                style: TextStyle(
                                  fontSize: badgeFontSize,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (status != IssueStatus.none) ...[
                      const SizedBox(height: 3),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: labelSize,
                          fontWeight: FontWeight.w800,
                          color: color,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Top / Bottom bars ────────────────────────────────────────────────────────

class _TopBar extends StatelessWidget {
  final StationStatus station;
  final double height;
  final Color barBg;

  const _TopBar({required this.station, required this.height, required this.barBg});

  @override
  Widget build(BuildContext context) {
    final iconSize = (height * 0.36).clamp(8.0, 17.0);
    final textSize = (height * 0.22).clamp(6.0, 10.0);
    final vPad     = (height * 0.10).clamp(1.0, 6.0);

    final ds          = station.dsLink;
    final radioLinked = station.radioLink.linked || (ds?.radioLinked ?? false);
    final ping        = ds?.tripTimeMs;

    return Container(
      height: height,
      color: barBg,
      padding: EdgeInsets.symmetric(vertical: vPad, horizontal: 4),
      child: Row(
        children: [
          Expanded(child: _IconTile(
            icon: Icons.cable_rounded,
            value: station.ethernet ? 'ETH' : 'NO ETH',
            status: station.ethernet ? ConnStatus.ok : ConnStatus.none,
            iconSize: iconSize, textSize: textSize,
          )),
          Expanded(child: _IconTile(
            icon: Icons.laptop_rounded,
            value: ds?.dsLinked == true ? 'DS' : 'NO DS',
            status: dsConnStatus(station),
            iconSize: iconSize, textSize: textSize,
          )),
          Expanded(child: _IconTile(
            icon: radioLinked ? Icons.wifi_rounded : Icons.wifi_off_rounded,
            value: radioLinked ? 'RADIO' : 'NO AP',
            status: radioConnStatus(station),
            iconSize: iconSize, textSize: textSize,
          )),
          Expanded(child: _IconTile(
            icon: Icons.timer_outlined,
            value: ping != null ? '${ping}ms' : '—ms',
            status: pingConnStatus(ping),
            iconSize: iconSize, textSize: textSize,
            showIcon: false,
          )),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final StationStatus station;
  final double height;
  final int matchState;
  final Color barBg;

  const _BottomBar({
    required this.station,
    required this.height,
    required this.matchState,
    required this.barBg,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = (height * 0.36).clamp(8.0, 17.0);
    final textSize = (height * 0.22).clamp(6.0, 10.0);
    final vPad     = (height * 0.10).clamp(1.0, 6.0);

    final ds          = station.dsLink;
    final batt        = ds?.batteryVoltage;
    final rioLinked   = ds?.rioLinked ?? false;
    final codeRunning = ds?.codeRunning ?? false;

    return Container(
      height: height,
      color: barBg,
      padding: EdgeInsets.symmetric(vertical: vPad, horizontal: 4),
      child: Row(
        children: [
          Expanded(child: _IconTile(
            icon: Icons.developer_board_rounded,
            value: rioLinked ? 'RIO' : 'NO RIO',
            status: rioLinked
                ? ConnStatus.ok
                : (ds != null ? ConnStatus.error : ConnStatus.none),
            iconSize: iconSize, textSize: textSize,
          )),
          Expanded(child: _IconTile(
            icon: Icons.battery_full_rounded,
            value: (batt != null && batt > 0)
                ? '${batt.toStringAsFixed(1)}v'
                : '—v',
            status: battConnStatus(station, matchState),
            iconSize: iconSize, textSize: textSize,
            showIcon: false,
          )),
          Expanded(child: _IconTile(
            icon: Icons.memory_rounded,
            value: codeRunning ? 'CODE' : 'NO CODE',
            status: codeConnStatus(station),
            iconSize: iconSize, textSize: textSize,
          )),
        ],
      ),
    );
  }
}

// ─── Main card ────────────────────────────────────────────────────────────────

class RobotStationCard extends ConsumerStatefulWidget {
  final String stationKey;
  final StationStatus station;
  final bool isRed;
  final int matchState;

  const RobotStationCard({
    super.key,
    required this.stationKey,
    required this.station,
    required this.isRed,
    required this.matchState,
  });

  @override
  ConsumerState<RobotStationCard> createState() => _RobotStationCardState();
}

class _RobotStationCardState extends ConsumerState<RobotStationCard> {
  void _openTicketHistory() {
    final station = widget.station;
    if (station.teamId == null) return;
    final settings = ref.read(appSettingsProvider);
    final teamDisplay = station.teamNickname?.isNotEmpty == true
        ? '${station.teamId} \u2014 ${station.teamNickname}'
        : station.teamName != null
            ? '${station.teamId} \u2014 ${station.teamName}'
            : '${station.teamId}';
    showTicketHistory(
      context,
      settings: settings,
      teamId: station.teamId!,
      teamDisplay: teamDisplay,
    );
  }

  /// Open the pit alert dialog for this station.
  Future<void> _openPitAlert() async {
    final arena = ref.read(arenaProvider);
    final field = arena.field;

    final alertCtx = field != null
        ? PitAlertContext.fromStation(
            stationKey: widget.stationKey,
            station: widget.station,
            field: field,
          )
        : PitAlertContext(
            teamId: widget.station.teamId,
            teamName: widget.station.teamName,
            teamNickname: widget.station.teamNickname,
            stationLabel: widget.stationKey,
          );

    if (!mounted) return;

    final result = await showPitAlertDialog(context, alertCtx);

    if (result != null && mounted) {
      ref.flagStation(widget.stationKey);

      // Post to ArenaLink server — Discord message + status broadcast.
      final settings = ref.read(appSettingsProvider);
      try {
        await postAlert(settings, result);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to send alert: $e'),
              backgroundColor: Colors.red.shade800,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final issueStatus = ref.watchIssueFor(widget.stationKey);
    final openCount   = ref.watchOpenCountFor(widget.stationKey);

    final stateDisp  = computeStationState(widget.station, widget.matchState);
    final style      = _deriveCardStyle(
      stateDisp,
      widget.isRed ? arenaRed : arenaBlue,
    );
    final stationNum = widget.stationKey.substring(1);
    const accentH    = 8.0;

    return GestureDetector(
      onLongPress: _openPitAlert,
      child: LayoutBuilder(
        builder: (context, outerConstraints) {
          final totalH = outerConstraints.hasBoundedHeight
              ? outerConstraints.maxHeight
              : 180.0;
          final barH = (totalH * 0.18).clamp(18.0, 44.0);

          return Container(
            decoration: BoxDecoration(
              color: surfaceCard,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: style.borderColor, width: 1.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Column(
                children: [
                  _TopBar(
                    station: widget.station,
                    height: barH,
                    barBg: style.barBg,
                  ),
                  Divider(height: 1, thickness: 1, color: style.dividerColor),

                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, cc) {
                        final h = cc.maxHeight;
                        final w = cc.maxWidth;
                        final sz          = min(h, w);
                        final teamFont    = (sz * 0.40).clamp(14.0, 40.0);
                        final stateFont   = (sz * 0.40).clamp(14.0, 40.0);
                        final statSubFont = (sz * 0.17).clamp(8.0, 16.0);
                        final stationFont = (h * 0.36).clamp(12.0, 22.0);
                        final nickFont    = (sz * 0.11).clamp(7.0, 12.0);

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Station number
                            Container(
                              width: 30,
                              color: style.allianceColor,
                              alignment: Alignment.center,
                              child: Text(
                                stationNum,
                                style: TextStyle(
                                  fontSize: stationFont,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 1, thickness: 1,
                              color: style.dividerColor,
                            ),

                            // Team number
                            Expanded(
                              flex: 1,
                              child: _CenterCol(
                                centerBg: style.centerBg,
                                accentColor: style.accentColor,
                                showAccent: style.showAccent,
                                accentH: accentH,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          widget.station.teamId != null
                                              ? '${widget.station.teamId}'
                                              : '—',
                                          style: TextStyle(
                                            fontSize: teamFont,
                                            fontWeight: FontWeight.w900,
                                            color: style.allianceColor
                                                .withValues(alpha: 0.95),
                                            height: 1.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      if (widget.station.teamId != null) ...[
                                        SizedBox(height: (sz * 0.04).clamp(2.0, 6.0)),
                                        Text(
                                          widget.station.teamNickname?.isNotEmpty == true
                                              ? widget.station.teamNickname!
                                              : (widget.station.teamName ?? ''),
                                          style: TextStyle(
                                            fontSize: nickFont,
                                            color: style.allianceColor
                                                .withValues(alpha: 0.50),
                                            height: 1.1,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 1, thickness: 1,
                              color: style.dividerColor,
                            ),

                            // State label
                            Expanded(
                              flex: 1,
                              child: _CenterCol(
                                centerBg: style.centerBg,
                                accentColor: style.accentColor,
                                showAccent: style.showAccent,
                                accentH: accentH,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          stateDisp.label,
                                          style: TextStyle(
                                            fontSize: stateFont,
                                            fontWeight: FontWeight.w900,
                                            color: stateDisp.color,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        for (final s in stateDisp.subs) ...[
                                          SizedBox(height: (sz * 0.02).clamp(1.0, 4.0)),
                                          Text(
                                            s,
                                            style: TextStyle(
                                              fontSize: statSubFont,
                                              fontWeight: FontWeight.w700,
                                              color: stateDisp.color
                                                  .withValues(alpha: 0.75),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 1, thickness: 1,
                              color: style.dividerColor,
                            ),

                            // Issue indicator — flag tap opens alert dialog,
                            // history tap opens ticket history sheet
                            _IssueColumn(
                              status: issueStatus,
                              allianceColor: style.allianceColor,
                              centerH: h,
                              onTap: _openPitAlert,
                              openCount: openCount,
                              onHistoryTap: widget.station.teamId != null
                                  ? _openTicketHistory
                                  : null,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  Divider(height: 1, thickness: 1, color: style.dividerColor),
                  _BottomBar(
                    station: widget.station,
                    height: barH,
                    matchState: widget.matchState,
                    barBg: style.barBg,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Center column helper ─────────────────────────────────────────────────────

class _CenterCol extends StatelessWidget {
  final Color centerBg;
  final Color accentColor;
  final bool showAccent;
  final double accentH;
  final Widget child;

  const _CenterCol({
    required this.centerBg,
    required this.accentColor,
    required this.showAccent,
    required this.accentH,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: centerBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showAccent) Container(height: accentH, color: accentColor),
          Expanded(child: child),
          if (showAccent) Container(height: accentH, color: accentColor),
        ],
      ),
    );
  }
}
