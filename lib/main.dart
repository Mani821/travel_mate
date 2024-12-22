import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_companion/core/utils/nav_manager.dart';
import 'package:travel_companion/screens/intro&splash/splash_page.dart';
import 'package:travel_companion/services/pref_manager.dart';
import 'core/app_themes.dart';


late SharedPreferences prefs;
late FirebaseAuth auth;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  auth = FirebaseAuth.instance;
  runApp(const ProviderScope(child: MyApp()));
}


final prefManager = PrefManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
      navigatorKey: navigatorKey,
    );
  }
}