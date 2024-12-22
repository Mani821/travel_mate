import 'package:flutter/material.dart';
import '../../core/constants.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor;

  const CustomOutlineButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 13)),
                side: WidgetStatePropertyAll(
                    BorderSide(color: buttonColor ?? primaryColor)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lexend',
                    color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
