import 'package:flutter/material.dart';

class PreferenceToggle extends StatelessWidget {
  final String label;
  final bool value;
  final bool border;
  final ValueChanged<bool> onChanged;

  const PreferenceToggle({
    super.key,
    required this.label,
    required this.value,
    required this.border,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: border ? Border.all(width: .01) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontSize: 16.0),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
