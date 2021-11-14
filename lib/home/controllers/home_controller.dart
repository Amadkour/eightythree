import 'package:eightythree/home/providers/home_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:eightythree/home/providers/home.dart';

class HomeController extends GetxController {
  RxList<dynamic> homes = [].obs;
  Home home;
  RxBool fetching=false.obs;
  var homeController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  getdata();

  }
getdata() async {
    fetching.value=true;
  homes.value =await HomeApi().getHomes();
    fetching.value=false;
}
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // ProductDatabaseHelper.db.close();
  }
}
