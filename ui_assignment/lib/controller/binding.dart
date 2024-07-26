import 'package:get/get.dart';
import 'package:ui_assignment/controller/setting_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
