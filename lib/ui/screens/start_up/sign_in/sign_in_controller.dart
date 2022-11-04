import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var emailTextField = TextEditingController();
  var passwordTextField = TextEditingController();
  RxDouble yOffset = 1.0.obs;

  @override
  void onInit() {
    Timer(const Duration(milliseconds: 1), () {
      yOffset.value = 0.00;
    });
    super.onInit();
  }
}
