import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/screens/check_out/check_out_screen.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    qty=widget.productModel.qty??1;
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    AppProvider appProvider=Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Routes.push(context: context, page: const CartScreen());
              },
              icon: const Icon(Icons.shopping_cart_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
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
                        if(widget.productModel.isFavorite){
                          appProvider.addFavoriteProvider(widget.productModel);

                        }else{
                          appProvider.removeFavoriteProvider(widget.productModel);
                        }
                      },
                      icon: Icon(
                       appProvider.getFavoriteList.contains(widget.productModel)
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ))
                ],
              ),
              CustomText(text: "Price : \$${widget.productModel.price}",fontWeight: FontWeight.bold,color: Colors.amber,),
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
                    onPressed: () {
                      setState(() {
                        if (qty > 1) {
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
                  CustomText(
                    text: qty.toString(),
                    size: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
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
              // const Spacer(),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        ProductModel productModel=widget.productModel.copyWith(qty: qty);
                        appProvider.addCartProvider(productModel);
                        showMessage(message: 'Added To cart');
                      },
                      child: const CustomText(
                        text: "Add To Cart",
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: () {
                    ProductModel productModel=widget.productModel.copyWith(qty: qty);
                     Routes.push(context: context, page: CheckOutScreen(productModel: productModel,));
                  }, child: const Text("Buy Now"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
