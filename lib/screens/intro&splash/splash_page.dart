import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:travel_companion/core/utils/nav_manager.dart';
import 'package:travel_companion/screens/authentication/authentication_handler.dart';
import '../../main.dart';
import 'onBoarding_handler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(2.seconds, () {
      bool onBoardingShown = prefs.getBool('onBoardingShown') ?? false;
      NavManager.gotoAndRemoveAllPrevious(onBoardingShown
          ? const AuthenticationHandler()
          : const OnBoardingHandler());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
          child:
              Hero(
                tag: "auth",
                child: Image.asset('assets/images/appIcon.png').animate().fade().scale(
                      curve: Curves.elasticOut,
                      duration: 1400.ms,
                    ),
              ),
        ),
      ),
    );
  }
}
