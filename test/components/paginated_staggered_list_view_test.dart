import 'package:deskcar/components/paginated_staggered_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppPaginatedStaggeredListView loads first page only initially', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppPaginatedStaggeredListView(
            itemCount: 30,
            listAnimationKey: 1,
            animateItems: false,
            itemKeyBuilder: (index) => 'item-$index',
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => SizedBox(
              height: 48,
              child: Text('Item $index'),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Item 0'), findsOneWidget);
    expect(find.text('Item 15'), findsNothing);
  });

  testWidgets('AppPaginatedStaggeredListView loads next page on scroll', (
    WidgetTester tester,
  ) async {
    final controller = ScrollController();

    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppPaginatedStaggeredListView(
            controller: controller,
            itemCount: 30,
            listAnimationKey: 1,
            animateItems: false,
            loadMoreThreshold: 0,
            itemKeyBuilder: (index) => 'item-$index',
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => SizedBox(
              height: 48,
              child: Text('Item $index'),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    controller.jumpTo(controller.position.maxScrollExtent);
    await tester.pumpAndSettle();

    await tester.fling(find.byType(Scrollable), const Offset(0, -1200), 1200);
    await tester.pumpAndSettle();

    expect(find.text('Item 29'), findsOneWidget);
  });

  testWidgets('AppPaginatedStaggeredListView resets when listAnimationKey changes', (
    WidgetTester tester,
  ) async {
    final controller = ScrollController();

    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppPaginatedStaggeredListView(
            controller: controller,
            itemCount: 30,
            listAnimationKey: 1,
            animateItems: false,
            loadMoreThreshold: 0,
            itemKeyBuilder: (index) => 'item-$index',
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => SizedBox(
              height: 48,
              child: Text('Item $index'),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    controller.jumpTo(controller.position.maxScrollExtent);
    await tester.pumpAndSettle();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppPaginatedStaggeredListView(
            controller: controller,
            itemCount: 30,
            listAnimationKey: 2,
            animateItems: false,
            loadMoreThreshold: 0,
            itemKeyBuilder: (index) => 'item-$index',
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => SizedBox(
              height: 48,
              child: Text('Item $index'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Item 29'), findsNothing);

    controller.jumpTo(0);
    await tester.pumpAndSettle();

    expect(find.text('Item 0'), findsOneWidget);
  });
}
