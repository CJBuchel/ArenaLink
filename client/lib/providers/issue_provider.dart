import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arena_link/views/field_monitor/widgets/station_state.dart';

// ─── Issue status notifier ────────────────────────────────────────────────────

class IssueStatusNotifier extends Notifier<Map<String, IssueStatus>> {
  @override
  Map<String, IssueStatus> build() => const {};

  void flag(String station) =>
      state = {...state, station: IssueStatus.flagged};

  void setInProgress(String station) =>
      state = {...state, station: IssueStatus.inProgress};

  void resolve(String station) =>
      state = {...state, station: IssueStatus.resolved};

  void clear(String station) =>
      state = Map.of(state)..remove(station);

  void setStatus(String station, IssueStatus status) {
    if (status == IssueStatus.none) {
      clear(station);
    } else {
      state = {...state, station: status};
    }
  }

  void clearAll() => state = const {};
}

final issueStatusProvider =
    NotifierProvider<IssueStatusNotifier, Map<String, IssueStatus>>(
  IssueStatusNotifier.new,
);

// ─── Open ticket count notifier ───────────────────────────────────────────────
// Tracks how many non-resolved tickets exist per station (by station key).
// Updated by ticket_status_provider when the server broadcasts open_count.

class OpenCountNotifier extends Notifier<Map<String, int>> {
  @override
  Map<String, int> build() => const {};

  void setCount(String station, int count) {
    if (count <= 0) {
      state = Map.of(state)..remove(station);
    } else {
      state = {...state, station: count};
    }
  }

  void clearAll() => state = const {};
}

final openCountProvider =
    NotifierProvider<OpenCountNotifier, Map<String, int>>(
  OpenCountNotifier.new,
);

// ─── Team status map ──────────────────────────────────────────────────────────
// Mirrors TicketStatusNotifier._cache so the Teams view can reactively show
// per-team ticket badges without going through station-key indirection.
// Key: team_id, Value: (IssueStatus, open_count)

class TeamStatusMapNotifier extends Notifier<Map<int, (IssueStatus, int)>> {
  @override
  Map<int, (IssueStatus, int)> build() => const {};

  void setAll(Map<int, (IssueStatus, int)> map) => state = map;
}

final teamStatusMapProvider =
    NotifierProvider<TeamStatusMapNotifier, Map<int, (IssueStatus, int)>>(
  TeamStatusMapNotifier.new,
);

// ─── Convenience extensions ───────────────────────────────────────────────────

extension IssueStatusWidgetRef on WidgetRef {
  IssueStatus watchIssueFor(String station) =>
      watch(issueStatusProvider)[station] ?? IssueStatus.none;

  int watchOpenCountFor(String station) =>
      watch(openCountProvider)[station] ?? 0;

  void flagStation(String station) =>
      read(issueStatusProvider.notifier).flag(station);

  void setStationInProgress(String station) =>
      read(issueStatusProvider.notifier).setInProgress(station);

  void resolveStation(String station) =>
      read(issueStatusProvider.notifier).resolve(station);

  void clearStation(String station) =>
      read(issueStatusProvider.notifier).clear(station);
}
