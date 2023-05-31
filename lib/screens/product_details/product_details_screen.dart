import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetWorkImage(
                image: widget.productModel.image,
                height: 300,
                width: size.width),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.productModel.name,
                  fontWeight: FontWeight.bold,
                  size: 18.0,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.productModel.isFavorite =
                            !widget.productModel.isFavorite;
                      });
                    },
                    icon: Icon(
                      widget.productModel.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ))
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            CustomText(text: widget.productModel.description),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                 CupertinoButton(
                   padding: EdgeInsets.zero,
                   onPressed: (){
                    setState(() {
                      if(qty>=1){
                        qty--;
                      }
                    });
                   },
                   child: const CircleAvatar(
                    child: Icon(Icons.remove),
                ),
                 ),
                const SizedBox(
                  width: 12.0,
                ),
                CustomText(text: qty.toString(),size: 22,fontWeight: FontWeight.bold,),
                const SizedBox(
                  width: 12.0,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    setState(() {

                        qty++;

                    });
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                ),

              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: (){}, child: const CustomText(text: "Add To Cart",)),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: (){}, child: const Text("Buy Now"))
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
