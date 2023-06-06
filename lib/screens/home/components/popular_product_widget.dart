import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/screens/product_details/product_details_screen.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class PopularProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const PopularProductWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey.shade200, width: 2)),
        child: Column(
          children: [
            CustomNetWorkImage(
                image: productModel.image,
                height: 100,
                width: 100),
            const SizedBox(
              height: 10,
            ),
            CustomText(text: productModel.name.toString()),
            const SizedBox(
              height: 5,
            ),
            CustomText(text: "price:\$${productModel.price}"),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () async{
                await Routes.push(context: context, page: ProductDetailsScreen(productModel: productModel));
              },
              child: const CustomText(
                text: "Buy now",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
