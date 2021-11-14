import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eightythree/routes/app_pages.dart';
void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.grey,
      ),
      title: "FCI",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}