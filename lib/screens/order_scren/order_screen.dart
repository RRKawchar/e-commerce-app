import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/model/order_model/order_model.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Your Orders",),
        centerTitle: true,

      ),
      body: FutureBuilder(
        future: FirebaseFireStoreHelper.instance.getOrder(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.data!.isEmpty || snapshot.data==null || !snapshot.hasData){
            return const Center(child: CustomText(text: "No Order Found",),);
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                
                OrderModel orderModel=snapshot.data![index];
            return ExpansionTile(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color:Colors.red)
              ),
              title: CustomText(text: orderModel.payment,),
              initiallyExpanded: index.isEven,
              children: [
             ListTile(
               title: CustomText(text: orderModel.status,),
             )
              ],
            );

          });
        },
      ),
    );
  }
}
