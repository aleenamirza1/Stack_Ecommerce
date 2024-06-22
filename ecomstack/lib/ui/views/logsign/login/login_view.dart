import 'package:EcomStack/ui/models/Buttons.dart';
import 'package:EcomStack/ui/models/TextField.dart';
// import 'package:EcomStack/ui/models/auth_controller.dart';
import 'package:EcomStack/ui/views/logsign/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthController authController = AuthController();
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                      labelText: "Email",
                      controller: viewmodel.loginemailController),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextField(
                      labelText: "Password",
                      controller: viewmodel.loginpassController),
                  ReusableButton(
                    text: "Login",
                    onTap: () {
                      viewmodel.loginUser();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      ElevatedButton(
                        onPressed: () {
                          viewmodel.goToSignUp(context);
                        },
                        child: const Text("SignUp"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
