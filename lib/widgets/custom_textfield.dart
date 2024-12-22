import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

class MyTextField extends StatefulWidget {
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
  final String? Function(String?)? validator;

  const MyTextField(
      {super.key,
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
        this.validator});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        onTap: widget.onTap,
        controller: widget.controller,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        style: GoogleFonts.lexend(
            color: Colors.black,
            fontSize: 14),
        decoration: InputDecoration(
          suffixIcon: widget.isPasswordField
              ? IconButton(
            onPressed: () {
              widget.onSuffixTap!(widget.obSecureText);
            },
            icon: Icon(
              widget.obSecureText
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: Colors.grey[400],
              size: 19,
            ),
          )
              : widget.controller.text.isNotEmpty
              ? IconButton(
              onPressed: () {
                widget.controller.clear();
              },
              icon: Icon(
                CupertinoIcons.clear_thick_circled,
                color: Colors.grey[500],
                size: 20,
              ))
              : null,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontFamily: 'Lexend',
            fontSize: 12,
          ),
          errorStyle: GoogleFonts.lexend(color: Colors.red, fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        textCapitalization: widget.capitalization,
        cursorColor: primaryColor,
        obscureText: widget.obSecureText,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        minLines: widget.minLines,
      ),
    );
  }
}
