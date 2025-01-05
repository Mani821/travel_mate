import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_companion/core/utils/nav_manager.dart';
import 'package:travel_companion/core/validators.dart';
import 'package:travel_companion/screens/authentication/forgot_pass_page.dart';
import 'package:travel_companion/screens/authentication/register_page.dart';
import 'package:travel_companion/screens/view_handler/main_view_handler.dart';
import 'package:travel_companion/widgets/buttons/custom_button.dart';
import 'package:travel_companion/widgets/custom_textfield.dart';
import '../../core/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSecure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF6F8F9),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFF6F8F9),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Form(
        key: _formKey,
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
                      height: 300,
                      width: 300,
                    )),
                const SizedBox(height: 50),
                MyTextField(
                  controller: emailController,
                  hint: "Enter your email",
                  validator: emailValidator,
                ),
                MyTextField(
                  controller: passwordController,
                  validator: passwordValidator,
                  hint: 'Enter your password',
                  isPasswordField: true,
                  obSecureText: isSecure,
                  onSuffixTap: (val) {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      NavManager.goTo(const ForgotPassPage());
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: "Sign In",
                    onPressed: () {
                      NavManager.gotoAndRemoveAllPrevious(const MainViewHandler());
                    }),
                Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavManager.replace(const RegisterPage());
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
      ),
    );
  }
}
