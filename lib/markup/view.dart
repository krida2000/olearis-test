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
            title: const Text('Markup'),
            actions: [
              IconButton(
                onPressed: c.addItem,
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: c.removeItem,
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/olearis.png',
                ),
                Obx(() {
                  return GridView.builder(
                    itemCount: c.itemsCount.value,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Text('Item $index');
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
