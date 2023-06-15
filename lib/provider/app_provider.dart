// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/firebase_helper/firebase_storage_helper/firebase_storage_helpers.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/model/user_model/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  UserModel? _userModel;

  UserModel get getUserInformation => _userModel!;

  /// Cart Provider..........................

  final List<ProductModel> _cartProductList = [];
  final List<ProductModel> _buyProductList = [];

  void addCartProvider(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProvider(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get catProviderList => _cartProductList;

  /// Favorite Provider.........................

  final List<ProductModel> _favoriteProductList = [];

  void addFavoriteProvider(ProductModel productModel) {
    _favoriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavoriteProvider(ProductModel productModel) {
    _favoriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavoriteList => _favoriteProductList;

  /// User Information
  void getUserInfoFirebase() async {
    _userModel = await FirebaseFireStoreHelper.instance.getUserInformation();
    notifyListeners();
  }

  void updateUserInfoFirebase(
      BuildContext context, UserModel userModel, File? file) async {
    if (file == null) {
      showLoaderDialog(context);
      _userModel = userModel;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      Navigator.of(context,rootNavigator: true).pop();
      Navigator.of(context).pop();
    } else {
      showLoaderDialog(context);
      String imageUrl = await FirebaseStorageHelpers.instance.uploadImage(file);
      _userModel = userModel.copyWith(image: imageUrl);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_userModel!.id)
          .set(_userModel!.toJson());

      Navigator.of(context,rootNavigator: true).pop();
      Navigator.of(context).pop();
    }
    showMessage(message: 'Successfully Updated Profile');
    notifyListeners();
  }

  /// TOTAL PRICE////// ///////
  double totalPrice(){
    double totalPrice=0.0;

    for(var element in _cartProductList){

      double price= double.parse(element.price);
      totalPrice+=price* element.qty!;
    }
    return totalPrice;
  }

  double totalBuyProductList(){
    double totalPrice=0.0;

    for(var element in _buyProductList){

      double price= double.parse(element.price);
      totalPrice+=price* element.qty!;
    }
    return totalPrice;
  }


  updateQty(ProductModel productModel,int qty){
    int index=_cartProductList.indexOf(productModel);
    _cartProductList[index].qty=qty;
    notifyListeners();
  }


  /// buy Product/ / / ////////////////////

   void addBuyProduct(ProductModel productModel){
    _buyProductList.add(productModel);
    notifyListeners();
   }

  void addBuyProductCartList(){
    _buyProductList.addAll(_cartProductList);
    notifyListeners();
  }

  void clearCart(){
    _cartProductList.clear();
    notifyListeners();
  }

  void clearBuyProduct(){
    _buyProductList.clear();
    notifyListeners();
  }


  List<ProductModel> get getBuyProductList=> _buyProductList;

}
