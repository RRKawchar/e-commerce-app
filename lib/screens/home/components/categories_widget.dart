import 'package:e_commerce_app/model/categories_model/categories_model.dart';
import 'package:e_commerce_app/widgets/custom_network_image/custom_network_image.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoriesWidget({Key? key, required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child:CustomNetWorkImage(image: categoriesModel.image.toString(),height:double.infinity,width: double.infinity,)
          ),
        ),
        CustomText(
          text: categoriesModel.name,
          maxLine: 2,
        )
      ],
    );
  }
}
