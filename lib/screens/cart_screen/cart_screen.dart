import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/cart_item_checkout/cart_item_checkout.dart';
import 'package:e_commerce_app/screens/cart_screen/components/single_cart_items.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
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
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Total',
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                    CustomText(
                      text: '\$${appProvider.totalPrice().toString()}',
                      fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                PrimaryButton(
                  title: "CheckOut",
                  onPressed: () {
                    appProvider.clearBuyProduct();
                    appProvider.addBuyProductCartList();
                    appProvider.clearCart();
                    if (appProvider.getBuyProductList.isEmpty) {
                      showMessage(message: "Cart is Empty!!");
                    } else {
                      Routes.push(
                          context: context, page: const CartItemCheckOut());
                    }
                  },
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const CustomText(
            text: 'Cart Screen',
            size: 20,
          ),
          centerTitle: true,
        ),
        body: appProvider.catProviderList.isEmpty
            ? const Center(
                child: CustomText(
                  text: "Empty",
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12.0),
                itemCount: appProvider.catProviderList.length,
                itemBuilder: (context, index) {
                  return SingleCartItems(
                    productModel: appProvider.catProviderList[index],
                  );
                }));
  }
}
