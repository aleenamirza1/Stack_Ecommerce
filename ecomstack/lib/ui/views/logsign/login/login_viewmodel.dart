import 'package:EcomStack/app/app.locator.dart';
import 'package:EcomStack/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final navigationService = locator<NavigationService>();
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpassController = TextEditingController();

  Future<void> loginUser() async {
    final user = await _auth.signInWithEmailAndPassword(
      email: loginemailController.text,
      password: loginpassController.text,
    );
    // ignore: unnecessary_null_comparison
    if (user != null) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("user ID", user.user!.uid);
      print(user.user!.uid);
      navigationService.navigateToHomeView();
    } else {
      print("error");
    }
  }

  goToSignUp(context) {
    print("Workingggg");
    navigationService.navigateTo('/signup');
    print("after");
  }
}
