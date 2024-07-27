import 'package:flutter/material.dart';

enum FrequencyOption { daily, spacificDays, interval, asneeded }

class FrequencySelectionWidget extends StatelessWidget {
  final FrequencyOption selectedFrequency;
  final ValueChanged<FrequencyOption?> onChanged;

  const FrequencySelectionWidget({
    super.key,
    required this.selectedFrequency,
    required this.onChanged,
  });

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
          title: const Text('Specific Days'),
          value: FrequencyOption.spacificDays,
          groupValue: selectedFrequency,
          onChanged: onChanged,
        ),
        RadioListTile<FrequencyOption>(
          title: const Text('Interval'),
          value: FrequencyOption.interval,
          groupValue: selectedFrequency,
          onChanged: onChanged,
        ),
        RadioListTile<FrequencyOption>(
          title: const Text('As needed'),
          value: FrequencyOption.asneeded,
          groupValue: selectedFrequency,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
