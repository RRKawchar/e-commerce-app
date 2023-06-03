import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFavoriteItems extends StatefulWidget {
  final ProductModel productModel;
  const SingleFavoriteItems({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<SingleFavoriteItems> createState() => _SingleFavoriteItemsState();
}

class _SingleFavoriteItemsState extends State<SingleFavoriteItems> {

  @override
  Widget build(BuildContext context) {
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
              width: 100,
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

                            CupertinoButton(
                              onPressed: () {
                                AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
                                appProvider.removeFavoriteProvider(widget.productModel);
                                showMessage(message: 'Remove from WishList');
                              },
                              child: const CustomText(
                                text: "Remove To WishList",
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
