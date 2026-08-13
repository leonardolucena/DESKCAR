import 'dart:math' as math;

import 'package:deskcar/components/staggered_list_entrance.dart';
import 'package:flutter/material.dart';

abstract final class AppListConstants {
  static const int pageSize = 15;
}

typedef AppPaginatedListItemBuilder = Widget Function(
  BuildContext context,
  int index,
);

typedef AppPaginatedListSeparatorBuilder = Widget Function(
  BuildContext context,
  int index,
);

typedef AppPaginatedListItemKeyBuilder = String Function(int index);

/// Lista com scroll infinito em lotes e animação em cascata por lote.
class AppPaginatedStaggeredListView extends StatefulWidget {
  const AppPaginatedStaggeredListView({
    super.key,
    required this.itemCount,
    required this.listAnimationKey,
    required this.itemKeyBuilder,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.pageSize = AppListConstants.pageSize,
    this.animateItems = true,
    this.loadMoreThreshold = 240,
    this.controller,
  });

  final int itemCount;
  final int listAnimationKey;
  final AppPaginatedListItemKeyBuilder itemKeyBuilder;
  final AppPaginatedListItemBuilder itemBuilder;
  final AppPaginatedListSeparatorBuilder separatorBuilder;
  final int pageSize;
  final bool animateItems;
  final double loadMoreThreshold;
  final ScrollController? controller;

  @override
  State<AppPaginatedStaggeredListView> createState() =>
      _AppPaginatedStaggeredListViewState();
}

class _AppPaginatedStaggeredListViewState
    extends State<AppPaginatedStaggeredListView> {
  late ScrollController _scrollController;
  late int _visibleCount;
  var _ownsScrollController = false;

  @override
  void initState() {
    super.initState();
    _ownsScrollController = widget.controller == null;
    _scrollController = widget.controller ?? ScrollController();
    _scrollController.addListener(_onScroll);
    _visibleCount = _initialVisibleCount();
  }

  @override
  void didUpdateWidget(covariant AppPaginatedStaggeredListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.listAnimationKey != widget.listAnimationKey) {
      _visibleCount = _initialVisibleCount();
      return;
    }

    if (_visibleCount > widget.itemCount) {
      _visibleCount = widget.itemCount;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    if (_ownsScrollController) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  int _initialVisibleCount() {
    return math.min(widget.pageSize, widget.itemCount);
  }

  void _onScroll() {
    if (!_scrollController.hasClients || !mounted) {
      return;
    }

    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - widget.loadMoreThreshold) {
      return;
    }

    _loadMore();
  }

  void _loadMore() {
    if (_visibleCount >= widget.itemCount) {
      return;
    }

    setState(() {
      _visibleCount = math.min(
        _visibleCount + widget.pageSize,
        widget.itemCount,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: _visibleCount,
      separatorBuilder: widget.separatorBuilder,
      itemBuilder: (context, index) {
        final batchIndex = index ~/ widget.pageSize;
        final indexInBatch = index % widget.pageSize;
        final itemKey = widget.itemKeyBuilder(index);

        return AppStaggeredListEntrance(
          key: ValueKey(
            '${widget.listAnimationKey}-batch-$batchIndex-$itemKey',
          ),
          index: indexInBatch,
          enabled: widget.animateItems,
          maxAnimatedItems: widget.pageSize,
          child: widget.itemBuilder(context, index),
        );
      },
    );
  }
}
