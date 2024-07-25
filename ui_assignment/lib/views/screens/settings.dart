import 'package:flutter/material.dart';
import 'package:ui_assignment/views/widgets/alarm_dropdown.dart';
import 'package:ui_assignment/views/widgets/date_range.dart';
import 'package:ui_assignment/views/widgets/preference_toggle.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Add your onPressed action here
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
        title: const Text('Device setting'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    PreferenceToggle(
                      border: false,
                      label: 'Set Vacation Time',
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Start date & time'),
                    ),
                    DateRange(
                      controller: _startDateController,
                      labelText: 'DD MM / YYYY',
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('End date & time'),
                    ),
                    DateRange(
                      controller: _endDateController,
                      labelText: 'DD MM / YYYY',
                    ),
                  ],
                ),
              ),
              PreferenceToggle(
                border: true,
                label: 'Set Vacation Time',
                value: false,
                onChanged: (value) {},
              ),
              PreferenceToggle(
                border: true,
                label: 'Set Vacation Time',
                value: false,
                onChanged: (value) {},
              ),
              PreferenceToggle(
                border: true,
                label: 'Set Vacation Time',
                value: false,
                onChanged: (value) {},
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: .1),
                ),
                child: Column(
                  children: [
                    AlarmDropdown(
                      items: const ['Chimes', 'Rooster', 'Sweet Piano'],
                      selectedItem: 'Rooster',
                      onChanged: (value) {},
                    ),
                    AlarmDropdown(
                      items: const ['Low', 'Medium', 'Louder'],
                      selectedItem: 'Low',
                      onChanged: (value) {},
                    ),
                    AlarmDropdown(
                      items: const ['5 Min', '10 Min', '15 Min'],
                      selectedItem: '5 Min',
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
