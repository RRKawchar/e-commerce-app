import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/model/categories_model/categories_model.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _firestore.collection('categories').doc(id)
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
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
    await _firestore.collection('users').doc(
        FirebaseAuth.instance.currentUser!.uid).get();

    return UserModel.fromJson(querySnapshot.data()!);
  }
}
