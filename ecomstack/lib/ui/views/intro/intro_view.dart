import 'package:EcomStack/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'intro_viewmodel.dart';

class IntroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IntroViewModel>.reactive(
        viewModelBuilder: () => IntroViewModel(),
        onViewModelReady: (viewmodel) {
          viewmodel.setContext(context);
        },
        builder: (context, viewmodel, child) => Scaffold(
                body: IntroductionScreen(
              pages: viewmodel.pages,
              onDone: viewmodel.onDone,
              onSkip: viewmodel.onSkip,
              showSkipButton: true,
              skip: const Text(
                'Skip',
                style: TextStyle(
                    fontSize: 18,
                    color: BlackColor,
                    fontWeight: FontWeight.w700),
              ),
              next: const Text(
                "Next",
                style: TextStyle(
                    fontSize: 18,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w700),
              ),
              done: const Text("Get Started",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: PrimaryColor)),
              globalBackgroundColor: BackgroundColor,
              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(25.0, 10.0),
                activeColor: BlackColor,
                color: GreyColor,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            )));
  }
}
