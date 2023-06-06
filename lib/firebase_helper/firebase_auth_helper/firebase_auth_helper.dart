// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
 static FirebaseAuthHelper instance=FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
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
     {
       required String name,
       required String email,
       required String password,
       required BuildContext context}) async {
   try {
     showLoaderDialog(context);
    UserCredential userCredential= await _auth.createUserWithEmailAndPassword(email: email, password: password);

     UserModel userModel=UserModel(image: '', id: userCredential.user!.uid, name: name,email: email);
     _firestore.collection('users').doc(userModel.id).set(userModel.toJson());
     Navigator.of(context).pop();
     return true;
   } on FirebaseAuthException catch (e) {
     Navigator.of(context).pop();
     showMessage(message: e.code.toString());
     return false;
   }
 }

 void signOut()async{

    await _auth.signOut();
 }
}
