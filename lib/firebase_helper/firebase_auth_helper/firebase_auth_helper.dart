// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
 static FirebaseAuthHelper instance=FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
     showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
     Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
     showMessage(message: e.code.toString());
      return false;
    }
  }

 Future<bool> signUp(
     {required String email,
       required String password,
       required BuildContext context}) async {
   try {
     showLoaderDialog(context);
     await _auth.createUserWithEmailAndPassword(email: email, password: password);
     Navigator.of(context).pop();
     return true;
   } on FirebaseAuthException catch (e) {
     Navigator.of(context).pop();
     showMessage(message: e.code.toString());
     return false;
   }
 }
}
