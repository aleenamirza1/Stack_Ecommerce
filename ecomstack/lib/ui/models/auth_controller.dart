// ignore_for_file: unnecessary_null_comparison

import 'package:EcomStack/app/app.router.dart';
import 'package:EcomStack/ui/views/logsign/login/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpassController = TextEditingController();

  NavigationService _navigationService = NavigationService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> creatAccount() async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passController.text);
    final firestore = FirebaseFirestore.instance;
    firestore
        .collection("users")
        .doc(user.user!.uid)
        .set({"email": emailController.text, "password": passController.text});

    if (user != null) {
      _navigationService.navigateToLoginView();
    } else {
      print("error");
    }
  }

  Future<void> LoginUser() async {
    final user = await _auth.signInWithEmailAndPassword(
      email: loginemailController.text,
      password: loginpassController.text,
    );
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user ID", user.user!.uid);
      print(user.user!.uid);
      _navigationService.navigateToHomeView();
    } else {
      print("error");
    }
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(LoginView());
  }
}
