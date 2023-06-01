import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleCartItems extends StatefulWidget {
  const SingleCartItems({Key? key}) : super(key: key);

  @override
  State<SingleCartItems> createState() => _SingleCartItemsState();
}

class _SingleCartItemsState extends State<SingleCartItems> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: primaryColor.withOpacity(0.5),
              width: 2
          )
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 120,
            child: CustomNetWorkImage(image: "https://www.aptronixindia.com/media/catalog/product/i/p/iphone1164gbpurple_2.png",height: 120,width: 100,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 2,top: 10,right: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: "Iphone 11 pro max",maxLine: 2,size: 15,fontWeight: FontWeight.w600,),
                        Row(
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){
                                setState(() {
                                  if(qty>1){
                                    qty--;
                                  }
                                });
                              },
                              child: const CircleAvatar(
                                maxRadius: 12,
                                child: Icon(Icons.remove,size: 17,),
                              ),
                            ),
                            CustomText(text: qty.toString(),size: 20,fontWeight: FontWeight.w500,),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){
                                setState(() {

                                  qty++;

                                });
                              },
                              child: const CircleAvatar(
                                maxRadius: 12,
                                child: Icon(Icons.add,size: 17,),
                              ),
                            ),

                          ],
                        ),


                        CupertinoButton(
                            onPressed: (){

                            },
                            child: const CustomText(text: "Add To WishList",color: primaryColor,fontWeight: FontWeight.w500,))

                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const CustomText(text: "\$344",size: 18,fontWeight: FontWeight.w700,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
