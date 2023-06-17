import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/custom_bottom_bar/custom_bottom_navbar.dart';
import 'package:e_commerce_app/stripe_helper/stripe_helper.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  final ProductModel productModel;
  const CheckOutScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Check Out',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3.0)),
              child: Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      }),
                  const Icon(Icons.money),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const CustomText(
                    text: 'Cash on Delivery',
                    fontWeight: FontWeight.bold,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3.0)),
              child: Row(
                children: [
                  Radio(
                      value: 2,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      }),
                  const Icon(Icons.money),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const CustomText(
                    text: 'Pay Online',
                    fontWeight: FontWeight.bold,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              title: "Continues",
              onPressed: () async {
                appProvider.clearBuyProduct();
                appProvider.addBuyProduct(widget.productModel);
                if (groupValue == 1) {
                  bool value = await FirebaseFireStoreHelper.instance
                      .uploadOrderProductFirebase(
                    appProvider.getBuyProductList,
                    context,
                    "Cash on Delivery",
                  );
                  appProvider.clearBuyProduct();
                  if (value) {
                    Future.delayed(const Duration(seconds: 2), () {
                      Routes.push(
                          context: context, page: const CustomBottomNavbar());
                    });
                  }
                }else{
                  int value=double.parse(appProvider.totalBuyProductList().toString()).round().toInt();
                  String totalPrice=(value * 100).toString();

                  await StripeHelper.instance.makePayment(context, totalPrice.toString());

                }
              },
            )
          ],
        ),
      ),
    );
  }
}
