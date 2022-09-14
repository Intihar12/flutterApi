
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'About'),
     Tab(text: 'Services'),
     Tab(text: 'Gallery',),
    // Tab(text: 'View',)
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}