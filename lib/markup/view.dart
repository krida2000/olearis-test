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
          body: LayoutBuilder(builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
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
                            child: Image.asset(
                              'assets/olearis.png',
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Obx(() {
                        return SizedBox(
                          height: ((constraints.maxWidth - 30) / 8 + 10) *
                                  (c.itemsCount.value / 2).ceil() +
                              10,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: GridView.builder(
                              itemCount: c.itemsCount.value,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 4,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                  child: GridTile(
                                    child: Center(child: Text('Item $index')),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
