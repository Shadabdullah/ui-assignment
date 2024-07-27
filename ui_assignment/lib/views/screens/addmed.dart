import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_assignment/controller/data_controller.dart';
import 'package:ui_assignment/controller/setting_controller.dart';
import 'package:ui_assignment/models/medicine.dart';
import 'package:ui_assignment/views/widgets/fequency.dart';
import 'package:ui_assignment/views/widgets/settings_label.dart';

class AddMedScreen extends StatefulWidget {
  const AddMedScreen({super.key});

  @override
  State<AddMedScreen> createState() => _AddMedScreenState();
}

class _AddMedScreenState extends State<AddMedScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  FrequencyOption _selectedFrequency = FrequencyOption.daily;

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find<DataController>();
    final SettingController settingController = Get.find<SettingController>();

    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            centerTitle: true,
            title: const Text(
              'Add Medicine Info',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  dataController.addMedicine(
                    Medicine(
                      name: nameController.text,
                      dose: int.tryParse(doseController.text) ?? 0,
                      frequency: _selectedFrequency.toString(),
                      time: timeController.text,
                      ringtone: settingController.ringtone.value,
                      strength: settingController.vibrationStrength.value,
                      snooz: settingController.snoozeDuration.value,
                    ),
                  );
                  nameController.clear();
                  doseController.clear();
                  timeController.clear();
                  setState(() {});
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isKeyboardVisible
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SizedBox(
                width: 200,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    dataController.addMedicine(
                      Medicine(
                        name: nameController.text,
                        dose: int.tryParse(doseController.text) ?? 0,
                        frequency: _selectedFrequency.toString(),
                        time: timeController.text,
                        ringtone: settingController.ringtone.value,
                        strength: settingController.vibrationStrength.value,
                        snooz: settingController.snoozeDuration.value,
                      ),
                    );
                    // Clear the fields after adding
                    nameController.clear();
                    doseController.clear();
                    timeController.clear();
                    setState(() {}); // Refresh the UI to show the updated list
                  },
                  backgroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  label: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.add5,
                        color: Colors.cyan,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Add Item',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SettingsLabel(value: 'Medicine Name'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter medicine name',
                      ),
                    ),
                  ),
                  SettingsLabel(value: 'Dose & Time'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TextField(
                              controller: doseController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                hintText: 'Enter dose',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: timeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                hintText: 'HH:MM',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Frequency",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FrequencySelectionWidget(
                    selectedFrequency: _selectedFrequency,
                    onChanged: (FrequencyOption? value) {
                      setState(() {
                        _selectedFrequency = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final medicines = dataController.doses;
                final medicine = medicines[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    children: [
                      SettingsLabel(value: 'Set time & dose'),
                      const SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.1),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(medicine.time.isEmpty
                                  ? "10:5"
                                  : medicine.time),
                              Text('${medicine.dose} ml'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: dataController.doses.length,
            ),
          ),
        ],
      ),
    );
  }
}
