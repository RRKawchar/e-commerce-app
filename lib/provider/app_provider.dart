import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier{

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
}