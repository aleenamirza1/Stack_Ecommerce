import 'package:EcomStack/ui/models/Buttons.dart';
import 'package:EcomStack/ui/models/TextField.dart';
// import 'package:EcomStack/ui/models/auth_controller.dart';
import 'package:EcomStack/ui/views/logsign/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthController authController = AuthController();
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignupViewModel(),
        builder: (context, viewmodel, child) => Scaffold(
              appBar: AppBar(
                title: Text("SignUp"),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ReusableTextField(
                          labelText: "Email",
                          controller: viewmodel.emailController),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableTextField(
                          labelText: "Password",
                          controller: viewmodel.passController),
                      ReusableButton(
                        text: "SignUp",
                        onTap: () {
                          // authController.creatAccount();
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: viewmodel.navigatToLogin(),
                            child: Text("Login"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
