import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_assignment/util/transition.dart';
import 'package:ui_assignment/views/widgets/selection_wheel.dart';

import '../../controller/setting_controller.dart';

class AlarmDropdown extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final String label;

  const AlarmDropdown(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.label});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(RouteUtils.fadePageRoute(
          builder: (context) => SelectionWheel(
              items: items, headingLabel: label, controller: settingController),
        ));
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(selectedItem), const Icon(Icons.expand_more)],
            ),
          )),
    );
  }
}
