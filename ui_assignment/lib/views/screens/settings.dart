import 'package:flutter/material.dart';
import 'package:ui_assignment/views/widgets/alarm_dropdown.dart';
import 'package:ui_assignment/views/widgets/date_range.dart';
import 'package:ui_assignment/views/widgets/preference_toggle.dart';
import 'package:ui_assignment/views/widgets/settings_label.dart';

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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: true,
        title: const Text(
          'Device setting',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
                    SettingsLabel(value: "Start date & time "),
                    DateRange(
                      controller: _startDateController,
                      labelText: 'DD MM / YYYY',
                    ),
                    SettingsLabel(value: "End date & time "),
                    DateRange(
                      controller: _endDateController,
                      labelText: 'DD MM / YYYY',
                    ),
                  ],
                ),
              ),
              PreferenceToggle(
                border: true,
                label: 'Show meds name',
                value: false,
                onChanged: (value) {},
              ),
              PreferenceToggle(
                border: true,
                label: 'Notify pharma to autofil',
                value: false,
                onChanged: (value) {},
              ),
              PreferenceToggle(
                border: true,
                label: 'Add sorry Time',
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
                    SettingsLabel(value: 'Alarm tune'),
                    const AlarmDropdown(
                      items: ['Chimes', 'Rooster', 'Sweet'],
                      selectedItem: 'Rooster',
                    ),
                    SettingsLabel(value: 'Alarm Strength'),
                    const AlarmDropdown(
                      items: ['Low', 'Medium', 'Louder'],
                      selectedItem: 'Low',
                    ),
                    SettingsLabel(value: 'Alarm Snooz'),
                    const AlarmDropdown(
                      items: ['5Min', '10Min', '15Min'],
                      selectedItem: '5Min',
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
