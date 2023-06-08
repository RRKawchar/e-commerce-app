// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/model/categories_model/categories_model.dart';
import 'package:e_commerce_app/model/order_model/order_model.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseFireStoreHelper {
  static FirebaseFireStoreHelper instance = FirebaseFireStoreHelper();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoriesModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('categories').get();

      List<CategoriesModel> categoriesList = querySnapshot.docs
          .map((e) => CategoriesModel.fromJson(e.data()))
          .toList();

      return categoriesList;
    } catch (e) {
      showMessage(message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getPopularProduct() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collectionGroup('products').get();

      List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return productList;
    } catch (e) {
      showMessage(message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryView(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('categories')
          .doc(id)
          .collection('products')
          .get();

      List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return productList;
    } catch (e) {
      showMessage(message: e.toString());
      return [];
    }
  }

  Future<UserModel> getUserInformation() async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return UserModel.fromJson(querySnapshot.data()!);
  }

  /// Upload Order ..........................................

  Future<bool> uploadOrderProductFirebase(
      List<ProductModel> list, BuildContext context, String payment) async {
    try {
      showLoaderDialog(context);
      double totalPrice = 0.0;
      for (var element in list) {
        double price = double.parse(element.price);
        totalPrice += price * element.qty!;
      }

      DocumentReference reference = _firestore
          .collection('UsersOrders')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('orders')
          .doc();
      DocumentReference admin=_firestore.collection('orders').doc();
      admin.set({
        'products': list.map((e) => e.toJson()),
        'status': "Pending",
        "totalPrice": totalPrice,
        'payment': payment,
      });
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(message: 'Ordered Successfully');
      return true;
    } catch (e) {
      showMessage(message: e.toString());
      Navigator.of(context, rootNavigator: true).pop();
      return false;
    }
  }

  /// Get Order from firebase////// /// //// /// / ///
  Future<List<OrderModel>> getOrder() async {
    try{

      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('UsersOrders')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('orders')
          .get();
      List<OrderModel> orderList=snapshot.docs.map((e) => OrderModel.fromJson(e.data())).toList();
      return orderList;
    }catch(e){
  showMessage(message: e.toString());
      return [];
    }
  }
}
