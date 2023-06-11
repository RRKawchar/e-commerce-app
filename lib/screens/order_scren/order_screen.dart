import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/model/order_model/order_model.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Your Orders",
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFireStoreHelper.instance.getOrder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty ||
              snapshot.data == null ||
              !snapshot.hasData) {
            return const Center(
              child: CustomText(
                text: "No Order Found",
              ),
            );
          }
          return ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                OrderModel orderModel = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    collapsedShape: const RoundedRectangleBorder(
                        side: BorderSide(color: primaryColor, width: 2.3)),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: primaryColor, width: 2.3)),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CustomNetWorkImage(
                            image: orderModel.product[0].image.toString(),
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 2, top: 10, right: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: orderModel.product[0].name.toString(),
                                  maxLine: 2,
                                  size: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                               orderModel.product.length>1?SizedBox.fromSize():Column(
                                 children: [
                                   CustomText(
                                     text: "Quantity :${orderModel.product[0].qty}",
                                     size: 16,
                                     fontWeight: FontWeight.w400,
                                   ),
                                   const SizedBox(
                                     height: 10,
                                   ),
                                 ],
                               ),

                                CustomText(
                                  text: "Total Price \$${orderModel.totalPrice}",
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: "Order Status :${orderModel.status}",
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    initiallyExpanded: index.isEven,
                    children: orderModel.product.length >1?
                    [

                      const CustomText(text: "Details",),
                      const Divider(color: primaryColor,),

                     ...orderModel.product.map((singleProduct){
                       return  Padding(
                         padding: const EdgeInsets.only(left: 12.0,top: 6.0),
                         child: Column(
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.baseline,
                               textBaseline: TextBaseline.alphabetic,
                               children: [
                                 SizedBox(
                                   width: 80,
                                   height: 80,
                                   child: CustomNetWorkImage(
                                     image: singleProduct.image.toString(),
                                     height: 80,
                                     width: 80,
                                   ),
                                 ),
                                 Expanded(
                                   child: Padding(
                                     padding:
                                     const EdgeInsets.only(left: 2, top: 10, right: 6),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         CustomText(
                                           text: singleProduct.name.toString(),
                                           maxLine: 2,
                                           size: 15,
                                           fontWeight: FontWeight.w600,
                                         ),
                                         const SizedBox(
                                           height: 10,
                                         ),
                                         Column(
                                           children: [
                                             CustomText(
                                               text: "Quantity :${singleProduct.qty}",
                                               size: 16,
                                               fontWeight: FontWeight.w400,
                                             ),
                                             const SizedBox(
                                               height: 10,
                                             ),
                                           ],
                                         ),

                                         CustomText(
                                           text: "Price \$${singleProduct.price}",
                                           size: 16,
                                           fontWeight: FontWeight.w400,
                                         ),

                                       ],
                                     ),
                                   ),
                                 )
                               ],
                             ),
                             const Divider(color: primaryColor,)
                           ],
                         ),
                       );
                     }).toList()
                    ]:[]
                  ),
                );
              });
        },
      ),
    );
  }
}


