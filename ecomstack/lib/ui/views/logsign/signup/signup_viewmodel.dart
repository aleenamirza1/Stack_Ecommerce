import 'package:EcomStack/app/app.locator.dart';
import 'package:EcomStack/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  navigatToLogin() {
    navigationService.navigateToLoginView();
  }
}
