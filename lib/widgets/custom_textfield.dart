import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final VoidCallback? onTap;
  final bool readOnly;
  final Function(bool)? onSuffixTap;
  final bool prefixIcon;
  final bool obSecureText;
  final bool isPasswordField;
  final Function(String)? onChanged;
  final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final IconData prefixIconData;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;


  const MyTextField({
    super.key,
    required this.controller,
    this.hint = "Enter text",
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.onTap,
    this.readOnly = false,
    this.onSuffixTap,
    this.prefixIcon = false,
    this.obSecureText = false,
    this.isPasswordField = false,
    this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.inputFormatters,
    this.prefixIconData = CupertinoIcons.search,
    this.focusNode,
    this.textInputAction,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: CupertinoTextField(
        inputFormatters: inputFormatters,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        textInputAction: textInputAction,
        style: GoogleFonts.lexend(color: Colors.black,fontSize: 14),
        placeholderStyle: GoogleFonts.lexend(color: CupertinoColors.systemGrey,fontSize: 14),
        prefix: prefixIcon ? Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            prefixIconData,
            color: hintColor,
          ),
        ) : null,
        suffix: isPasswordField ? IconButton(
          onPressed: () {
            if (onSuffixTap != null) {
              onSuffixTap!(true);
            }
          },
          icon: Icon(
            obSecureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            size: 20,
            color: hintColor,
          ),
        )  : IconButton(
          onPressed: () {
            controller.clear();
            if (onSuffixTap != null) {
              onSuffixTap!(true);
            }
          },
          icon: Icon(
            CupertinoIcons.xmark_circle_fill,
            size: 20,
            color: hintColor,
          ),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: hintColor),
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,

        textCapitalization: capitalization,
        cursorColor: primaryColor,
        suffixMode: OverlayVisibilityMode.editing,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
        placeholder: hint,
        obscureText: obSecureText,
        enabled: enabled,
        readOnly: readOnly,
        minLines: minLines,
      ),
    );
  }
}
