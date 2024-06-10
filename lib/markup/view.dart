import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class MarkupView extends StatelessWidget {
  const MarkupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MarkupController(),
      builder: (MarkupController c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Markup',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            actions: [
              IconButton(
                onPressed: c.addItem,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              IconButton(
                onPressed: c.removeItem,
                icon: Icon(
                  Icons.remove,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: CustomScrollView(
              reverse: true,
              physics: const KeepPositionScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              slivers: [
                Obx(() {
                  final int count = (c.itemsCount.value / 2).ceil();

                  return SliverPadding(
                    padding: const EdgeInsets.all(10),
                    sliver: SliverList.builder(
                        itemCount: count,
                        itemBuilder: (_, i) {
                          i = count - i - 1;

                          Widget item(int i) {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: AspectRatio(
                                  aspectRatio: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Center(child: Text('Item $i')),
                                  ),
                                ),
                              ),
                            );
                          }

                          final List<Widget> items = [item(i * 2)];

                          if (i == count - 1 && !c.itemsCount.value.isEven) {
                            items.add(Expanded(child: Container(height: 50)));
                          } else {
                            items.add(item(i * 2 + 1));
                          }

                          return Row(key: Key(i.toString()), children: items);
                        }),
                  );
                }),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/olearis.png'),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class KeepPositionScrollPhysics extends ScrollPhysics {
  const KeepPositionScrollPhysics({super.parent});

  @override
  KeepPositionScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return KeepPositionScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double adjustPositionForNewDimensions({
    required ScrollMetrics oldPosition,
    required ScrollMetrics newPosition,
    required bool isScrolling,
    required double velocity,
  }) {
    final position = super.adjustPositionForNewDimensions(
      oldPosition: oldPosition,
      newPosition: newPosition,
      isScrolling: isScrolling,
      velocity: velocity,
    );

    final diff = newPosition.maxScrollExtent - oldPosition.maxScrollExtent;

    if (diff > 0) {
      return position + diff;
    } else {
      return position;
    }
  }
}
