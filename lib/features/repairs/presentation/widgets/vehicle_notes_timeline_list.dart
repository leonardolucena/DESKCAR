import 'package:deskcar/components/paginated_staggered_list_view.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_constants.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_rail.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_tile.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_upcoming_entry.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_upcoming_tile.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';

class VehicleNotesTimelineList extends StatelessWidget {
  const VehicleNotesTimelineList({
    super.key,
    required this.records,
    required this.listAnimationKey,
    required this.animateItems,
    required this.onRecordTap,
    this.upcomingEntry,
  });

  final List<ServiceRecordEntity> records;
  final int listAnimationKey;
  final bool animateItems;
  final ValueChanged<ServiceRecordEntity> onRecordTap;
  final VehicleNoteUpcomingEntry? upcomingEntry;

  @override
  Widget build(BuildContext context) {
    final groups = _groupRecordsByMonth(records);
    final entries = _flattenGroups(groups, upcomingEntry);

    return AppPaginatedStaggeredListView(
      itemCount: entries.length,
      listAnimationKey: listAnimationKey,
      animateItems: animateItems,
      itemKeyBuilder: (index) => entries[index].key,
      separatorBuilder: (context, index) => const SizedBox.shrink(),
      itemBuilder: (context, index) {
        final entry = entries[index];

        return switch (entry) {
          _VehicleNoteUpcomingListEntry(
            :final upcoming,
            :final connectTop,
            :final connectBottom,
          ) =>
            VehicleNoteUpcomingTile(
              entry: upcoming,
              connectTop: connectTop,
              connectBottom: connectBottom,
            ),
          _VehicleNoteMonthHeaderEntry(
            :final month,
            :final connectTop,
            :final connectBottom,
          ) =>
            _MonthHeader(
              month: month,
              connectTop: connectTop,
              connectBottom: connectBottom,
            ),
          _VehicleNoteRecordEntry(
            :final record,
            :final showTopRail,
            :final showBottomRail,
          ) =>
            VehicleNoteTimelineTile(
              record: record,
              showTopRail: showTopRail,
              showBottomRail: showBottomRail,
              onTap: () => onRecordTap(record),
            ),
        };
      },
    );
  }

  List<_VehicleNoteMonthGroup> _groupRecordsByMonth(
    List<ServiceRecordEntity> records,
  ) {
    final sorted = [...records]
      ..sort((a, b) => b.serviceDate.compareTo(a.serviceDate));

    final groups = <_VehicleNoteMonthGroup>[];
    for (final record in sorted) {
      final month = DateTime(record.serviceDate.year, record.serviceDate.month);
      if (groups.isEmpty || groups.last.month != month) {
        groups.add(_VehicleNoteMonthGroup(month: month, records: [record]));
      } else {
        groups.last.records.add(record);
      }
    }

    return groups;
  }

  List<_VehicleNoteListEntry> _flattenGroups(
    List<_VehicleNoteMonthGroup> groups,
    VehicleNoteUpcomingEntry? upcomingEntry,
  ) {
    if (groups.isEmpty && upcomingEntry == null) {
      return const [];
    }

    final entries = <_VehicleNoteListEntry>[];
    final hasUpcoming = upcomingEntry != null;

    if (hasUpcoming) {
      entries.add(
        _VehicleNoteUpcomingListEntry(
          upcoming: upcomingEntry,
          connectTop: false,
          connectBottom: groups.isNotEmpty,
          key: 'upcoming-${upcomingEntry.title}',
        ),
      );
    }

    for (var groupIndex = 0; groupIndex < groups.length; groupIndex++) {
      final group = groups[groupIndex];
      entries.add(
        _VehicleNoteMonthHeaderEntry(
          month: group.month,
          connectTop: hasUpcoming || groupIndex > 0,
          connectBottom: true,
          key: 'month-${group.month.year}-${group.month.month}',
        ),
      );

      for (var recordIndex = 0; recordIndex < group.records.length; recordIndex++) {
        final record = group.records[recordIndex];
        final isLastInTimeline = groupIndex == groups.length - 1 &&
            recordIndex == group.records.length - 1;

        entries.add(
          _VehicleNoteRecordEntry(
            record: record,
            showTopRail: true,
            showBottomRail: !isLastInTimeline,
            key: record.id,
          ),
        );
      }
    }

    return entries;
  }
}

class _MonthHeader extends StatelessWidget {
  const _MonthHeader({
    required this.month,
    required this.connectTop,
    required this.connectBottom,
  });

  final DateTime month;
  final bool connectTop;
  final bool connectBottom;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VehicleNoteTimelineRail(
            connectTop: connectTop,
            connectBottom: connectBottom,
            child: SizedBox(
              width: VehicleNoteTimelineConstants.iconSize,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSizes.spacingSm,
                AppSizes.spacingMd,
                AppSizes.cardPadding,
                AppSizes.spacingXs,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppDateFormatter.formatMonthYearHeader(month),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppSurfaceColors.mutedText(context),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VehicleNoteMonthGroup {
  _VehicleNoteMonthGroup({
    required this.month,
    required this.records,
  });

  final DateTime month;
  final List<ServiceRecordEntity> records;
}

sealed class _VehicleNoteListEntry {
  const _VehicleNoteListEntry({required this.key});

  final String key;
}

final class _VehicleNoteUpcomingListEntry extends _VehicleNoteListEntry {
  const _VehicleNoteUpcomingListEntry({
    required this.upcoming,
    required this.connectTop,
    required this.connectBottom,
    required super.key,
  });

  final VehicleNoteUpcomingEntry upcoming;
  final bool connectTop;
  final bool connectBottom;
}

final class _VehicleNoteMonthHeaderEntry extends _VehicleNoteListEntry {
  const _VehicleNoteMonthHeaderEntry({
    required this.month,
    required this.connectTop,
    required this.connectBottom,
    required super.key,
  });

  final DateTime month;
  final bool connectTop;
  final bool connectBottom;
}

final class _VehicleNoteRecordEntry extends _VehicleNoteListEntry {
  const _VehicleNoteRecordEntry({
    required this.record,
    required this.showTopRail,
    required this.showBottomRail,
    required super.key,
  });

  final ServiceRecordEntity record;
  final bool showTopRail;
  final bool showBottomRail;
}
