import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_tracker_app/features/home/view/home_screen.dart';
import 'package:health_tracker_app/features/profile/profile_screen.dart';
import 'package:health_tracker_app/features/scan/view/scan_screen.dart';

class NavigationControllerMain extends GetxController {
  RxInt selectedNavIndex = 0.obs;

  List<Widget> getPages() {
    return [HomeScreen(), ScanScreen(), ProfileScreen()];
  }

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.qr_code_scanner_outlined,
    Icons.person_outline,
  ];

  final List<String> labels = ["Home", "Scan", "Profile"];
}
