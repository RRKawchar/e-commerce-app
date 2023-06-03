import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/favourite/widget/single_favorite_items.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(text: 'Favourite Screen',size: 20,),
          centerTitle: true,
        ),
        body:appProvider.getFavoriteList.isEmpty?const Center(child: CustomText(text: "Empty",),): ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: appProvider.getFavoriteList.length,
            itemBuilder: (context,index){
              return  SingleFavoriteItems(productModel: appProvider.getFavoriteList[index],);
            })
    );
  }
}
