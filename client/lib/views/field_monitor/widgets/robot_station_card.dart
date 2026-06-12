import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:arena_link/colors.dart';
import 'package:arena_link/models/arena_state.dart';
import 'package:arena_link/views/field_monitor/widgets/conn_pill.dart';
import 'package:arena_link/views/field_monitor/widgets/station_state.dart';

// ─── Icon tile (scalable) ─────────────────────────────────────────────────────

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

class _IssueColumn extends StatelessWidget {
  final IssueStatus status;
  final Color allianceColor;
  final double centerH;

  const _IssueColumn({
    required this.status,
    required this.allianceColor,
    required this.centerH,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = (centerH * 0.22).clamp(12.0, 22.0);
    final labelSize = (centerH * 0.09).clamp(7.0, 11.0);

    final (icon, color, label) = switch (status) {
      IssueStatus.flagged => (Icons.flag_rounded, arenaAmber, 'FLAG'),
      IssueStatus.inProgress => (Icons.engineering_rounded, arenaBlue, 'WIP'),
      IssueStatus.resolved => (Icons.task_alt_rounded, arenaGreen, 'DONE'),
      IssueStatus.none => (
        Icons.circle_outlined,
        allianceColor.withValues(alpha: 0.18),
        '',
      ),
    };

    return Container(
      width: 40,
      color: allianceColor.withValues(alpha: 0.08),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: color),
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
    );
  }
}

// ─── Top bar ──────────────────────────────────────────────────────────────────
// Connection order: ETH → DS → RADIO → PING

class _TopBar extends StatelessWidget {
  final StationStatus station;
  final double height;

  const _TopBar({required this.station, required this.height});

  @override
  Widget build(BuildContext context) {
    final iconSize = (height * 0.36).clamp(8.0, 17.0);
    final textSize = (height * 0.22).clamp(6.0, 10.0);
    final vPad = (height * 0.10).clamp(1.0, 6.0);

    final ds = station.dsLink;
    final radioLinked = station.radioLink.linked || (ds?.radioLinked ?? false);
    final ping = ds?.tripTimeMs;

    return Container(
      height: height,
      color: surfaceBar,
      padding: EdgeInsets.symmetric(vertical: vPad, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: _IconTile(
              icon: Icons.cable_rounded,
              value: station.ethernet ? 'ETH' : 'NO ETH',
              status: station.ethernet ? ConnStatus.ok : ConnStatus.none,
              iconSize: iconSize,
              textSize: textSize,
            ),
          ),
          Expanded(
            child: _IconTile(
              icon: Icons.laptop_rounded,
              value: ds?.dsLinked == true ? 'DS' : 'NO DS',
              status: dsConnStatus(station),
              iconSize: iconSize,
              textSize: textSize,
            ),
          ),
          Expanded(
            child: _IconTile(
              icon: radioLinked ? Icons.wifi_rounded : Icons.wifi_off_rounded,
              value: radioLinked ? 'RADIO' : 'NO AP',
              status: radioConnStatus(station),
              iconSize: iconSize,
              textSize: textSize,
            ),
          ),
          Expanded(
            child: _IconTile(
              icon: Icons.timer_outlined,
              value: ping != null ? '${ping}ms' : '—ms',
              status: pingConnStatus(ping),
              iconSize: iconSize,
              textSize: textSize,
              showIcon: false,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Bottom bar ───────────────────────────────────────────────────────────────
// Robot order: RIO → BATT → CODE

class _BottomBar extends StatelessWidget {
  final StationStatus station;
  final double height;
  final int matchState;

  const _BottomBar({
    required this.station,
    required this.height,
    required this.matchState,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = (height * 0.36).clamp(8.0, 17.0);
    final textSize = (height * 0.22).clamp(6.0, 10.0);
    final vPad = (height * 0.10).clamp(1.0, 6.0);

    final ds = station.dsLink;
    final batt = ds?.batteryVoltage;
    final rioLinked = ds?.rioLinked ?? false;
    final codeRunning = ds?.codeRunning ?? false;

    return Container(
      height: height,
      color: surfaceBar,
      padding: EdgeInsets.symmetric(vertical: vPad, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: _IconTile(
              icon: Icons.developer_board_rounded,
              value: rioLinked ? 'RIO' : 'NO RIO',
              status: rioLinked
                  ? ConnStatus.ok
                  : (ds != null ? ConnStatus.error : ConnStatus.none),
              iconSize: iconSize,
              textSize: textSize,
            ),
          ),
          Expanded(
            child: _IconTile(
              icon: Icons.battery_full_rounded,
              value: (batt != null && batt > 0)
                  ? '${batt.toStringAsFixed(1)}v'
                  : '—v',
              status: battConnStatus(station, matchState),
              iconSize: iconSize,
              textSize: textSize,
              showIcon: false,
            ),
          ),
          Expanded(
            child: _IconTile(
              icon: Icons.memory_rounded,
              value: codeRunning ? 'CODE' : 'NO CODE',
              status: codeConnStatus(station),
              iconSize: iconSize,
              textSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Main card ────────────────────────────────────────────────────────────────

class RobotStationCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final stateDisp = computeStationState(station, matchState);
    final baseAllianceColor = isRed ? arenaRed : arenaBlue;
    final allianceColor = switch (stateDisp.allianceMode) {
      AllianceMode.active => baseAllianceColor,
      AllianceMode.dim => labelMuted,
      AllianceMode.off => labelOff,
    };
    final centerBg = allianceColor.withValues(alpha: 0.12);
    final dividerColor = allianceColor.withValues(alpha: 0.22);
    final stationNum = stationKey.substring(1);
    final issueStatus = demoIssue(stationKey);
    final hasAlert = stateDisp.severity != StationSeverity.none;
    const accentH = 8.0;

    return LayoutBuilder(
      builder: (context, outerConstraints) {
        final totalH = outerConstraints.hasBoundedHeight
            ? outerConstraints.maxHeight
            : 180.0;
        final barH = (totalH * 0.18).clamp(18.0, 44.0);

        return Container(
          decoration: BoxDecoration(
            color: surfaceCard,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hasAlert
                  ? stateDisp.color.withValues(alpha: 0.55)
                  : allianceColor.withValues(alpha: 0.40),
              width: 1.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Column(
              children: [
                _TopBar(station: station, height: barH),
                Divider(height: 1, thickness: 1, color: dividerColor),

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, cc) {
                      final h = cc.maxHeight;
                      final w = cc.maxWidth;
                      // Use the tighter dimension so fonts shrink on narrow
                      // cards (portrait / small screens) as well as short ones.
                      final sz = min(h, w);
                      final teamFont = (sz * 0.40).clamp(14.0, 40.0);
                      final stateFont = (sz * 0.40).clamp(14.0, 40.0);
                      final statSubFont = (sz * 0.17).clamp(8.0, 16.0);
                      // Station col is always 30 px wide — keep h-based but cap tightly.
                      final stationFont = (h * 0.36).clamp(12.0, 22.0);
                      final nickFont = (sz * 0.11).clamp(7.0, 12.0);

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Station number
                          Container(
                            width: 30,
                            color: allianceColor,
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
                            width: 1,
                            thickness: 1,
                            color: dividerColor,
                          ),

                          // Team number
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: centerBg,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (hasAlert)
                                    Container(
                                      height: accentH,
                                      color: stateDisp.color,
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              station.teamId != null
                                                  ? '${station.teamId}'
                                                  : '—',
                                              style: TextStyle(
                                                fontSize: teamFont,
                                                fontWeight: FontWeight.w900,
                                                color: allianceColor.withValues(
                                                  alpha: 0.95,
                                                ),
                                                height: 1.0,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          if (station.teamId != null) ...[
                                            SizedBox(
                                              height: (sz * 0.04).clamp(
                                                2.0,
                                                6.0,
                                              ),
                                            ),
                                            Text(
                                              station
                                                          .teamNickname
                                                          ?.isNotEmpty ==
                                                      true
                                                  ? station.teamNickname!
                                                  : (station.teamName ?? ''),
                                              style: TextStyle(
                                                fontSize: nickFont,
                                                color: allianceColor.withValues(
                                                  alpha: 0.50,
                                                ),
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
                                  if (hasAlert)
                                    Container(
                                      height: accentH,
                                      color: stateDisp.color,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: dividerColor,
                          ),

                          // State label
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: centerBg,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (hasAlert)
                                    Container(
                                      height: accentH,
                                      color: stateDisp.color,
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              stateDisp.label,
                                              style: TextStyle(
                                                fontSize: stateFont,
                                                fontWeight: FontWeight.w900,
                                                color: stateDisp.color,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          for (final s in stateDisp.subs) ...[
                                            SizedBox(
                                              height: (sz * 0.02).clamp(
                                                1.0,
                                                4.0,
                                              ),
                                            ),
                                            FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                s,
                                                style: TextStyle(
                                                  fontSize: statSubFont,
                                                  fontWeight: FontWeight.w700,
                                                  color: stateDisp.color
                                                      .withValues(alpha: 0.75),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (hasAlert)
                                    Container(
                                      height: accentH,
                                      color: stateDisp.color,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: dividerColor,
                          ),

                          // Issue indicator
                          _IssueColumn(
                            status: issueStatus,
                            allianceColor: allianceColor,
                            centerH: h,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Divider(height: 1, thickness: 1, color: dividerColor),
                _BottomBar(
                  station: station,
                  height: barH,
                  matchState: matchState,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
