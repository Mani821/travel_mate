import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonColor;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: CupertinoButton(
              color: buttonColor ?? primaryColor,
              onPressed: onPressed,
              child: Text(
                text,
                style: GoogleFonts.lexend(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
