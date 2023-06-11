import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCartItems extends StatefulWidget {
  final ProductModel productModel;
  const SingleCartItems({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<SingleCartItems> createState() => _SingleCartItemsState();
}

class _SingleCartItemsState extends State<SingleCartItems> {
  int qty = 1;

  @override
  void initState() {
    qty=widget.productModel.qty??1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor.withOpacity(0.5), width: 2)),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: CustomNetWorkImage(
              image: widget.productModel.image,
              height: 120,
              width: 120,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 2, top: 10, right: 6),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: widget.productModel.name,
                              maxLine: 2,
                              size: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    if (qty > 1) {

                                      setState(() {
                                        qty--;
                                      });
                                      appProvider.updateQty(widget.productModel, qty);
                                    }


                                  },
                                  child: const CircleAvatar(
                                    maxRadius: 12,
                                    child: Icon(
                                      Icons.remove,
                                      size: 17,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: qty.toString(),
                                  size: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {

                                    setState(() {
                                      qty++;
                                    });

                                    appProvider.updateQty(widget.productModel, qty);
                                  },
                                  child: const CircleAvatar(
                                    maxRadius: 12,
                                    child: Icon(
                                      Icons.add,
                                      size: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CupertinoButton(
                              onPressed: () {

                                if(!appProvider.getFavoriteList.contains(widget.productModel)){
                                  appProvider.addFavoriteProvider(widget.productModel);
                                  showMessage(message: 'Added to WishList');
                                }else{
                                  appProvider.removeFavoriteProvider(widget.productModel);
                                  showMessage(message: 'Remove from WishList');
                                }
                              },
                              child: CustomText(
                                text:appProvider.getFavoriteList.contains(widget.productModel)? "Remove from WishList":"Add To WishList",
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: "\$${widget.productModel.price}",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                   Positioned(
                    bottom: 2,
                    right: 2,
                    child: CupertinoButton(
                      onPressed: (){
                        appProvider.removeCartProvider(widget.productModel);
                        showMessage(message: 'Remove from cart');
                      },
                      child: const CircleAvatar(
                          radius: 12,
                          child: Icon(Icons.delete)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
