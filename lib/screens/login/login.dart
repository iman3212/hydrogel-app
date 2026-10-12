import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/globalwidgets/textfield/logintextfield.dart';
import 'package:hydrogel/screens/login/controller.dart';
import 'package:hydrogel/theme/button.dart';
import 'package:hydrogel/theme/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Size size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "assets/img/login-pattern.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/logo-transparent.png",
                width: 180,
                height: 180,
              ),
              Text("Welcome Back",
                  style: Theme.of(context).textTheme.displaySmall),
              SizedBox(height: size.height * 0.01),
              Text(
                "Please enter your username and password",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              SizedBox(height: size.height * 0.05),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginTextfield(
                        controller: username,
                        label: "Username",
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      SizedBox(height: size.height * 0.016),
                      Obx(
                        () => LoginTextfield(
                            controller: password,
                            label: "Password",
                            obscureText: loginController.obscureText.value,
                            obscureIcon: IconButton(
                                color: LightThemeColor.primaryColor,
                                onPressed: () {
                                  loginController.obscure();
                                },
                                icon: Icon(
                                  loginController.obscureText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: LightThemeColor.primaryColor,
                                  size: 25,
                                )),
                            icon: Icon(
                              Icons.lock,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Obx(() => GradientButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        loginController.loginTokenRequest(
                            username.text, password.text);
                      } else {
                        Get.snackbar(
                          "warning",
                          "Filling this field is necessary",
                          colorText: Colors.red,
                          duration: const Duration(seconds: 5),
                        );
                      }
                    },
                    text: 'Login',
                    processing: loginController.processing.value,
                  )),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ]),
    );
  }
}
