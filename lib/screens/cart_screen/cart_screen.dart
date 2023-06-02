import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/cart_screen/components/single_cart_items.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Cart Screen',size: 20,),
        centerTitle: true,
      ),
      body:appProvider.catProviderList.isEmpty?const Center(child: CustomText(text: "Empty",),): ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount: appProvider.catProviderList.length,
          itemBuilder: (context,index){
            return  SingleCartItems(productModel: appProvider.catProviderList[index],);
          })
    );
  }
}
