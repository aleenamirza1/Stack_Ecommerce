import 'package:EcomStack/app/app.locator.dart';
import 'package:EcomStack/app/app.router.dart';
import 'package:EcomStack/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  void onDone() {
    if (_context != null) {
      GoToHomeView();
    }
  }

  void onSkip() {
    if (_context != null) {
      GoToHomeView();
    }
  }

  GoToHomeView() {
    navigationService.navigateToMainHome();
  }

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Choose Products",
      body:
          "Choosing the right products for your e-commerce app's intro pages is key to capturing user interest. Highlight popular items, new arrivals, and exclusive deals to create a compelling first impression and drive engagement.",
      image: Center(
        child: Image.asset(
          "assets/images/intro_pic2.png",
        ),
      ),
      decoration: const PageDecoration(
        pageColor: BackgroundColor,
        bodyTextStyle: TextStyle(fontSize: 20, color: GreyColor),
        titleTextStyle: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.bold,
          color: BlackColor,
        ),
      ),
    ),
    PageViewModel(
      title: "Make Payment",
      body:
          "Ensuring a smooth and secure payment process is crucial for customer satisfaction. Offer multiple payment options, maintain strong encryption, and provide clear instructions to facilitate a seamless transaction experience.",
      image: Center(
        child: Image.asset("assets/images/intro_pic3.png"),
      ),
      decoration: const PageDecoration(
        pageColor: BackgroundColor,
        bodyTextStyle: TextStyle(fontSize: 20, color: GreyColor),
        titleTextStyle: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.bold,
          color: BlackColor,
        ),
      ),
    ),
    PageViewModel(
      title: "Get You Order",
      body:
          "Experience the convenience of your order, where we prioritize prompt delivery and customer satisfaction. Our streamlined service ensures your purchases are swiftly delivered to your doorstep, making shopping effortless and efficient.",
      image: Center(
        child: Image.asset("assets/images/intro_pic1.png"),
      ),
      decoration: const PageDecoration(
        pageColor: BackgroundColor,
        bodyTextStyle: TextStyle(fontSize: 20, color: GreyColor),
        titleTextStyle: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.bold,
          color: BlackColor,
        ),
      ),
    ),
  ];
}
