import 'package:get/get.dart';
import 'package:ui_assignment/models/medicine.dart';

class DataController extends GetxController {
  RxList<Medicine> doses = <Medicine>[].obs;
  void addMedicine(Medicine medicine) {
    print("addding---------------");
    doses.add(medicine);
  }
}
