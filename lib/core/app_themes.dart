import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppTheme {
  // AppTheme(ThemeMode state) : super(state);

  // void toggleTheme(){
  //   state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  // }

  static final lightTheme = ThemeData(
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.lexend(
            color: textColor, fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: GoogleFonts.lexend(
            color: textColor, fontSize: 14, fontWeight: FontWeight.normal),
        displayLarge: GoogleFonts.lexend(
            color: textColor, fontSize: 96, fontWeight: FontWeight.w300),
        displayMedium: GoogleFonts.lexend(
            color: textColor, fontSize: 60, fontWeight: FontWeight.w300),
        displaySmall: GoogleFonts.lexend(
            color: textColor, fontSize: 48, fontWeight: FontWeight.w400),
        headlineMedium: GoogleFonts.lexend(
            color: textColor, fontSize: 34, fontWeight: FontWeight.w400),
        headlineSmall: GoogleFonts.lexend(
            color: textColor, fontSize: 24, fontWeight: FontWeight.w400),
        titleLarge: GoogleFonts.lexend(
            color: textColor, fontSize: 20, fontWeight: FontWeight.w500),
        titleMedium: GoogleFonts.lexend(
            color: textColor, fontSize: 16, fontWeight: FontWeight.w400),
        titleSmall: GoogleFonts.lexend(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
        labelLarge: GoogleFonts.lexend(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
        bodySmall: GoogleFonts.lexend(
            color: textColor, fontSize: 12, fontWeight: FontWeight.w400),
        labelSmall: GoogleFonts.lexend(
            color: textColor, fontSize: 10, fontWeight: FontWeight.w400),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              primaryColor,
            ),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            textStyle: WidgetStatePropertyAll(
                GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.w500)),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          )),
      scaffoldBackgroundColor: const Color(0xFFF6F8F9),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: const Color(0xFFF6F8F9),
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle:  SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: backgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: GoogleFonts.lexend(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          iconTheme: const IconThemeData(color: Colors.black)),
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: primaryColor,
        unselectedLabelColor: Colors.grey[600],
        labelColor: primaryColor,
        dividerColor: Colors.transparent,
        dividerHeight: 0
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ));
}
