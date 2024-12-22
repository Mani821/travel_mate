import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required VoidCallback onTap,
    required String title,
    required String message,
    required String buttonTitle,
    bool isLogin = false,
  }) {
    return showGeneralDialog<T>(
      context: context,
      pageBuilder: (context, _, __) => const SizedBox(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1.8 * curvedAnimation.value,
            sigmaY: 1.8 * curvedAnimation.value,
          ),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: ScaleTransition(
                scale: Tween<double>(begin: 0.5, end: 1.0)
                    .animate(curvedAnimation),
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 4) +
                        const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: double.infinity),
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lexend',
                              fontSize: 18),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 30,
                          endIndent: 30,
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SvgPicture.asset(
                            "assets/icons/warning.svg",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: isLogin
                              ? FilledButton.tonal(
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      backgroundColor:
                                          WidgetStateProperty.resolveWith(
                                              (states) => Colors.red),
                                      foregroundColor:
                                          WidgetStateProperty.resolveWith(
                                              (states) => Colors.white)),
                                  onPressed: onTap,
                                  child: Text(
                                    buttonTitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lexend',
                                        fontSize: 15),
                                  ),
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: FilledButton.tonal(
                                        style: ButtonStyle(
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Lexend',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: FilledButton.tonal(
                                        style: ButtonStyle(
                                            shape: WidgetStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            backgroundColor:
                                                WidgetStateProperty.resolveWith(
                                                    (states) => Colors.red),
                                            foregroundColor:
                                                WidgetStateProperty.resolveWith(
                                                    (states) => Colors.white)),
                                        onPressed: onTap,
                                        child: Text(
                                          buttonTitle,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Lexend',
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
