import 'package:flutter/material.dart';

enum FrequencyOption { daily, weekly, monthly, yearly }

class FrequencySelectionWidget extends StatelessWidget {
  final FrequencyOption selectedFrequency;
  final ValueChanged<FrequencyOption?> onChanged;

  const FrequencySelectionWidget({
    Key? key,
    required this.selectedFrequency,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<FrequencyOption>(
          title: const Text('Daily'),
          value: FrequencyOption.daily,
          groupValue: selectedFrequency,
          onChanged: onChanged,
        ),
        RadioListTile<FrequencyOption>(
          title: const Text('Weekly'),
          value: FrequencyOption.weekly,
          groupValue: selectedFrequency,
          onChanged: onChanged,
        ),
        RadioListTile<FrequencyOption>(
          title: const Text('Monthly'),
          value: FrequencyOption.monthly,
          groupValue: selectedFrequency,
          onChanged: onChanged,
        ),
        RadioListTile<FrequencyOption>(
          title: const Text('Yearly'),
          value: FrequencyOption.yearly,
          groupValue: selectedFrequency,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
