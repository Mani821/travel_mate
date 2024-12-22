import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';
import '../core/constants.dart';
import '../main.dart';

final authServiceProvider = Provider((ref) => AuthService());

class AuthService {
  final _usersCollection = FirebaseFirestore.instance.collection("Users");
  final uuid = const Uuid();


  AuthService();

  /// Method for logging out
  Future<Either<Failure, String>> logout({
    required BuildContext context,
  }) async {
    try {
      await _usersCollection.doc(auth.currentUser!.uid).update({
        "fcmToken": FieldValue.delete(),
      });
      await prefManager.clearAllData();
      await prefs.clear();
      await FirebaseAuth.instance.signOut();
      await prefs.setBool("shown", true);

      return Either.right("");
    } catch (e) {
      return Either.left(Failure('Something went wrong'));
    }
  }

  /// Method for sending password reset request
  Future<Either<Failure, String>> sendResetRequest({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return Either.right("An email has been sent to $email");
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        return Either.left(Failure('No user found for this email'));
      } else {
        debugPrint("Error $e  ${e.code}");
        return Either.left(Failure('Something went wrong'));
      }
    }
  }

  /// Method for user sign up
  Future<Either<Failure, String>> userSignUp({
    required String name,
    required String email,
    required String password,
    required String city,
    required String country,
    required double latitude,
    required double longitude,
    required List<String> favoriteTeams,
    required List<String> favClubs,
    required String dateOfBirth,
    required List<Map<String, dynamic>> sportsPlayed,
    required List<String> sportsPlayedList,
    required String address,
    required int gender,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      String token = '';
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _usersCollection.doc(authResult.user!.uid).set({
        'name': name,
        'email': email,
        'city': city,
        'country': country,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'gender': gender,
        'isVerified': false,
        'favClubs': FieldValue.arrayUnion(favClubs),
        'favoriteTeams': FieldValue.arrayUnion(favoriteTeams),
        'dateOfBirth': dateOfBirth,
        'sportsPlayed': FieldValue.arrayUnion(sportsPlayed),
        'uid': authResult.user!.uid,
        'matchesPlayed': 0,
        'manOfTheMatch': 0,
        'phoneNumber': phoneNumber,
      }, SetOptions(merge: true));

      await prefManager.saveUserData(
          name,
          email,
          sportsPlayedList,
          authResult.user?.uid ?? '',
          false,
          city,
          country,
          latitude,
          longitude,
          0,
          0,
          dateOfBirth,
          '',
          favoriteTeams,
          token ?? '',
          true,
          address,
          gender,
          false,
          favClubs,
          phoneNumber);

      return Either.right(authResult.user!.uid);
    } on FirebaseAuthException catch (e, stacktrace) {
      if (e.code == 'weak-password') {
        return Either.left(Failure("Enter a strong password"));
      } else if (e.code == 'email-already-in-use') {
        return Either.left(Failure("Email already in use"));
      } else {
        debugPrint("Error $e $stacktrace");
        return Either.left(Failure("Something went wrong"));
      }
    }
  }

  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snapshot = await _usersCollection.doc(authResult.user!.uid).get();
      if (snapshot.exists) {

      } else {
        return Either.left(
            Failure("No user found for this email. Please sign up"));
      }

      return Either.right("");
    } on FirebaseAuthException catch (e, stacktrace) {
      debugPrint("Authentication error $e, $stacktrace");
      if (e.code == 'wrong-password') {
        return Either.left(Failure("Wrong password"));
      } else if (e.code == "user-not-found") {
        return Either.left(
            Failure("No user found for this email. Please sign up"));
      } else if (e.code == 'invalid-email') {
        return Either.left(Failure("Invalid email"));
      } else if (e.code == "invalid-credential") {
        return Either.left(Failure("Invalid credentials"));
      } else if (e.code == 'too-many-requests') {
        return Either.left(Failure("Too many requests"));
      } else if (e.code == "network-request-failed") {
        return Either.left(Failure("Network request failed"));
      } else {
        return Either.left(Failure("Something went wrong"));
      }
    }
  }

  /// For changing password
  Future<Either<Failure, String>> updatePassword({
    required String oldPassword,
    required String newPassword,
    required BuildContext context,
  }) async {
    try {
      final credential = EmailAuthProvider.credential(
          email: auth.currentUser!.email!, password: oldPassword);

      final result =
          await auth.currentUser?.reauthenticateWithCredential(credential);
      if (result == null) {
        return Either.left(Failure("Wrong password"));
      } else {
        await auth.currentUser!.updatePassword(newPassword);
      }

      return Either.right("Password updated successfully");
    } on FirebaseAuthException catch (e, s) {
      debugPrint("This is error $e and stacktrace $s");
      if (e.code == "weak-password") {
        return Either.left(Failure("Enter a strong password"));
      } else {
        return Either.left(Failure("Something went wrong"));
      }
    }
  }
}
