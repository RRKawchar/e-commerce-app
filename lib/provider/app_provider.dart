import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/model/user_model/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier{

  UserModel? _userModel;

  UserModel get getUserInformation=> _userModel!;
  /// Cart Provider..........................

  final List<ProductModel> _catProductList=[];

  void addCartProvider(ProductModel productModel){
    _catProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProvider(ProductModel productModel){
    _catProductList.remove(productModel);
    notifyListeners();
  }
   List<ProductModel> get catProviderList=> _catProductList;



  /// Favorite Provider.........................

  final List<ProductModel> _favoriteProductList=[];


  void addFavoriteProvider(ProductModel productModel){
    _favoriteProductList.add(productModel);
    notifyListeners();
  }

  void removeFavoriteProvider(ProductModel productModel){
    _favoriteProductList.remove(productModel);
    notifyListeners();
  }
  List<ProductModel> get getFavoriteList=> _favoriteProductList;


  /// User Information
void getUserInfoFirebase()async{
  _userModel=await FirebaseFireStoreHelper.instance.getUserInformation();
  notifyListeners();

}

}