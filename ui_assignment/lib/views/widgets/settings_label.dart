import 'package:flutter/material.dart';

class SettingsLabel extends StatelessWidget {
  String value;
  SettingsLabel({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Align(alignment: Alignment.topLeft, child: Text(value)),
    );
  }
}
