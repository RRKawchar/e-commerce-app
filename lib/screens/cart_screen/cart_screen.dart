import 'package:e_commerce_app/screens/cart_screen/components/single_cart_items.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Cart Screen',size: 20,),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount: 8,
          itemBuilder: (context,index){
            return const SingleCartItems();
          })
    );
  }
}
