import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/model/categories_model/categories_model.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/screens/home/components/popular_product_widget.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final CategoriesModel categoriesModel;
  const CategoryView({Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productList = [];
  bool isLoading = false;

  @override
  void initState() {
    getCategoryView();
    super.initState();
  }

  getCategoryView() async {
    setState(() {
      isLoading = true;
    });
    productList = await FirebaseFireStoreHelper.instance
        .getCategoryView(widget.categoriesModel.id);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: CustomText(text: widget.categoriesModel.name),
        centerTitle: true,
      ),
      body:isLoading?const Center(child: CircularProgressIndicator(),): Column(
        children: [
          productList.isEmpty?const Center(child: CustomText(
            text: "Product is empty!!",
          ),):GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 230,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                ProductModel product = productList[index];
                return PopularProductWidget(
                  productModel: product,
                );
              }),
        ],
      ),
    );
  }
}
