import 'package:get/get.dart';

class SettingController extends GetxController {
  var isVacationTimeEnabled = true.obs;
  var shouldShowMedicationName = false.obs;
  var shouldNotifyPharmacist = false.obs;
  var shouldAddToStory = false.obs;

  var ringtone = ''.obs;
  var vibrationStrength = ''.obs;
  var snoozeDuration = ''.obs;
  final List<String> ringtones = ['Rooster', 'Sweet', 'Chime', 'Ding', 'Buzz'];

  final List<String> vibrationStrengths = ['Low', 'Medium', 'High'];

  final List<String> snoozeDurations = [
    '5Min',
    '10Min',
    '15Min',
  ];

  @override
  void onInit() {
    super.onInit();

    ringtone.value = ringtones.isNotEmpty ? ringtones[0] : '';
    vibrationStrength.value =
        vibrationStrengths.isNotEmpty ? vibrationStrengths[0] : '';
    snoozeDuration.value = snoozeDurations.isNotEmpty ? snoozeDurations[0] : '';
  }

  // Methods to update the boolean values
  void toggleVacationTime(bool value) => isVacationTimeEnabled.value = value;
  void toggleShowMedicationName(bool value) =>
      shouldShowMedicationName.value = value;
  void toggleNotifyPharmacist(bool value) =>
      shouldNotifyPharmacist.value = value;
  void toggleAddToStory(bool value) => shouldAddToStory.value = value;

  // Methods to update the strings
  void updateRingtone(String value) => ringtone.value = value;
  void updateVibrationStrength(String value) => vibrationStrength.value = value;
  void updateSnoozeDuration(String value) => snoozeDuration.value = value;
}
