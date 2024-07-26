import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/setting_controller.dart';
import '../widgets/alarm_dropdown.dart';
import '../widgets/date_range.dart';
import '../widgets/preference_toggle.dart';
import '../widgets/settings_label.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();

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
                    Obx(() => PreferenceToggle(
                          border: false,
                          label: 'Set Vacation Time',
                          value: settingController.isVacationTimeEnabled.value,
                          onChanged: (value) {
                            settingController.toggleVacationTime(value);
                          },
                        )),
                    SettingsLabel(value: "Start date & time "),
                    DateRange(
                      controller: TextEditingController(),
                      labelText: 'DD MM / YYYY',
                    ),
                    SettingsLabel(value: "End date & time "),
                    DateRange(
                      controller: TextEditingController(),
                      labelText: 'DD MM / YYYY',
                    ),
                  ],
                ),
              ),
              Obx(() => PreferenceToggle(
                    border: true,
                    label: 'Show meds name',
                    value: settingController.shouldShowMedicationName.value,
                    onChanged: (value) {
                      settingController.toggleShowMedicationName(value);
                    },
                  )),
              Obx(() => PreferenceToggle(
                    border: true,
                    label: 'Notify pharma to autofil',
                    value: settingController.shouldNotifyPharmacist.value,
                    onChanged: (value) {
                      settingController.toggleNotifyPharmacist(value);
                    },
                  )),
              Obx(() => PreferenceToggle(
                    border: true,
                    label: 'Add sorry Time',
                    value: settingController.shouldAddToStory.value,
                    onChanged: (value) {
                      settingController.toggleAddToStory(value);
                    },
                  )),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: .1),
                ),
                child: const Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Occupied Cabinets")),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "1 ,2 ,3 ,4",
                          style: TextStyle(color: Colors.grey),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: .1),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Alarm setting",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SettingsLabel(value: 'Alarm tune'),
                    Obx(() => AlarmDropdown(
                          items: settingController.ringtones,
                          selectedItem: settingController.ringtone.value,
                          label: "tune",
                        )),
                    SettingsLabel(value: 'Alarm Strength'),
                    Obx(() => AlarmDropdown(
                          items: settingController.vibrationStrengths,
                          selectedItem:
                              settingController.vibrationStrength.value,
                          label: "strength",
                        )),
                    SettingsLabel(value: 'Alarm Snooze'),
                    Obx(() => AlarmDropdown(
                          items: settingController.snoozeDurations,
                          selectedItem: settingController.snoozeDuration.value,
                          label: "snooz",
                        )),
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
