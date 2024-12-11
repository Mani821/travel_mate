import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel_companion/core/utils/nav_manager.dart';
import 'package:travel_companion/screens/authentication/login_page.dart';
import 'package:travel_companion/widgets/buttons/custom_button.dart';
import 'package:travel_companion/widgets/custom_textfield.dart';
import 'package:travel_companion/widgets/dialogs/custom_dialog.dart';
import '../../core/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  tag: 'auth',
                  child: Image.asset(
                    'assets/images/appIcon.png',
                    height: 240,
                    width: 240,
                  )),
              const SizedBox(height: 30),
              MyTextField(
                controller: nameController,
                hint: "Enter your name",
              ),
              MyTextField(
                controller: emailController,
                hint: "Enter your email",
              ),
              MyTextField(
                controller: passwordController,
                hint: 'Enter your password',
                isPasswordField: true,
                obSecureText: isSecure,
                onSuffixTap: (val) {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
              ),
              MyTextField(
                controller: confirmPassController,
                hint: 'Confirm password',
                isPasswordField: true,
                obSecureText: isSecure,
                onSuffixTap: (val) {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
              ),
              MyTextField(
                controller: locationController,
                hint: 'Enter your location',
                readOnly: true,
                onTap: ()async {
                  // MyDialog.show(
                  //   context: context,
                  //   onTap: () {},
                  //   title: "Enable Location",
                  //   message: 'Please enable the location',
                  //   buttonTitle: 'Enable',
                  // );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(text: "Register", onPressed: () {}),
              Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavManager.replace(const LoginPage());
                        },
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
