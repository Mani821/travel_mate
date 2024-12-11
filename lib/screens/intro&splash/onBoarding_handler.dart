import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_companion/screens/authentication/authentication_handler.dart';
import 'package:travel_companion/services/app_data_service.dart';
import '../../core/constants.dart';
import '../../core/utils/nav_manager.dart';
import '../../main.dart';
import '../home/home_page.dart';

class OnBoardingHandler extends StatefulWidget {
  const OnBoardingHandler({super.key});

  @override
  State<OnBoardingHandler> createState() => _OnBoardingHandlerState();
}

class _OnBoardingHandlerState extends State<OnBoardingHandler> {
  final controller = PageController();
  bool isLastPage = false;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () async {
                      await prefs.setBool("onBoardingShown", true);
                      NavManager.gotoAndRemoveAllPrevious(const HomePage());
                    },
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: "splash",
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: SizedBox(
                    key: ValueKey(pageIndex),
                    height: MediaQuery.of(context).size.height * 0.36,
                    child: Image.asset(
                      'assets/images/onBoarding$pageIndex.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: 4,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                      isLastPage = index == 3;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(14.0) +
                          const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            AppData.getOnboardingHeading(pageIndex),
                            key: ValueKey(pageIndex),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.rancho(
                              fontSize: 38,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            AppData.getOnboardingText(pageIndex),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: primaryColor,
                    dotColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                      onPressed: () async {
                        if (isLastPage) {
                          // await prefs.setBool("onBoardingShown", true);
                          NavManager.gotoAndRemoveAllPrevious(const AuthenticationHandler()); //TODO change this
                        } else {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        }
                      },
                      color: primaryColor,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: Text(
                          isLastPage ? 'Get Started' : 'Next',
                          key: ValueKey(isLastPage),
                          style:
                              GoogleFonts.lexend(fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
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
