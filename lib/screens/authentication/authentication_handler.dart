import 'package:flutter/material.dart';
import 'package:travel_companion/core/utils/nav_manager.dart';
import 'package:travel_companion/screens/authentication/login_page.dart';
import 'package:travel_companion/screens/authentication/register_page.dart';
import 'package:travel_companion/widgets/buttons/custom_button.dart';
import 'package:travel_companion/widgets/buttons/custom_outline_button.dart';

class AuthenticationHandler extends StatelessWidget {
  const AuthenticationHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Hero(
                  tag: 'auth',
                  child: Image.asset(
                    'assets/images/appIcon.png',
                    height: 340,
                    width: 340,
                  )),
            ),
            const Spacer(),
            CustomButton(
                text: 'Sign In',
                onPressed: () {
                  NavManager.goTo(const LoginPage());
                }),
            CustomOutlineButton(text: 'Sign Up', onPressed: () {
              NavManager.goTo(const RegisterPage());
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
