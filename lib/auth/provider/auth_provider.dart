import 'package:evently/common/services/firebase_serices.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuthProvider extends ChangeNotifier {
  UserModel? userModel;
  bool loading = false;
  Future<String?> userLogin(
      {required String email, required String password}) async {
    loading = true;
    notifyListeners();
    try {
      userModel =
          await FirebaseSerices.loginUser(email: email, password: password);
      loading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      String errorMessage = _getMessageFromErrorCode(e);
      loading = false;
      notifyListeners();
      return errorMessage;
    } on FirebaseException catch (e) {
      loading = false;
      notifyListeners();
      return e.message;
    } catch (e) {
      loading = false;
      notifyListeners();
      return e.toString();
    }
    return null;
  }

  Future<String?> userSignup(
      {required String email,
      required String password,
      required String name}) async {
    loading = true;
    notifyListeners();
    try {
      userModel = await FirebaseSerices.registerUser(
          email: email, password: password, name: name);
    } on FirebaseAuthException catch (e) {
      String errorMessage = _getMessageFromErrorCode(e);
      loading = false;
      notifyListeners();
      return errorMessage;
    } on FirebaseException catch (e) {
      loading = false;
      notifyListeners();
      return e.message;
    } catch (e) {
      loading = false;
      notifyListeners();
      return e.toString();
    }
    return null;
  }

  Future<void> getUser() async {
    userModel = await FirebaseSerices.getUserInfo(
        FirebaseAuth.instance.currentUser!.uid);
    notifyListeners();
  }

  String _getMessageFromErrorCode(e) {
    // Handle Firebase authentication-related errors
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email address is already in use. Please try logging in or use a different email.';
      case 'invalid-email':
        return 'The email address is invalid. Please check and enter a valid email.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'weak-password':
        return 'The password provided is too weak. Please use a stronger password.';
      case 'too-many-requests':
        return 'Too many requests at the moment. Please try again later.';
      case 'user-token-expired':
        return 'Your session has expired. Please log in again.';
      case 'network-request-failed':
        return 'Network error occurred. Please check your internet connection.';
      case 'invalid-credential':
        return 'The supplied auth credential is incorrect, malformed or has expired.';
      default:
        return 'An unknown error occurred: ${e.message}';
    }
  }
}
