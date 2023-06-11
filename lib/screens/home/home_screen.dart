import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/model/categories_model/categories_model.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/category_view/category_view.dart';
import 'package:e_commerce_app/screens/home/components/categories_widget.dart';
import 'package:e_commerce_app/screens/home/components/popular_product_widget.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:e_commerce_app/widgets/top_title/top_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoriesModel> categoriesList = [];
  List<ProductModel> productList = [];

  bool isLoading = false;
  @override
  void initState() {
    getCategories();
    AppProvider provider=Provider.of<AppProvider>(context,listen: false);
    provider.getUserInfoFirebase();
    super.initState();
  }

  void getCategories() async {
    setState(() {
      isLoading = true;
    });
    FirebaseFireStoreHelper.instance.updateTokenFromFirebase();
    categoriesList = await FirebaseFireStoreHelper.instance.getCategories();
    categoriesList.shuffle();
    productList = await FirebaseFireStoreHelper.instance.getPopularProduct();
    productList.shuffle();
   setState(() {
     isLoading = false;
   });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopTitle(
                          title: "Shopping Here",
                          subtitle: "",
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Search...."),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: 'Categories',
                      size: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    /// Categories ...................................

                    categoriesList.isEmpty
                        ? const Center(
                            child: CustomText(
                              text: "Category is Empty!!",
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoriesList.map((category) {
                                return InkWell(
                                    onTap: () {
                                      Routes.push(
                                          context: context,
                                          page: CategoryView(
                                              categoriesModel: category));
                                    },
                                    child: CategoriesWidget(
                                        categoriesModel: category));
                              }).toList(),
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: 'Popular Products',
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: productList.isEmpty ? 50 : 12,
                    ),

                    /// Popular Products.............................

                    productList.isEmpty
                        ? const Center(
                            child: CustomText(
                              text: "Popular Product is Empty!!",
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                    const SizedBox(
                      height: 12.0,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
