// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_firestore_helper/firebase_firestore_helper.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/custom_bottom_bar/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StripeHelper{
  static StripeHelper instance=StripeHelper();
  static const String secretKey = 'sk_test_51MvYuoCggqKRrymtoRugJYDzrii5RB8vbq2UcV4FBNQZevnEAb7H6A6VFRNhJGYXzI1LEknpebUVLoFIqe7QoSzb00EPbLN7kf';

  late Map<String, dynamic> paymentIntent;

  Future<void> makePayment(BuildContext context, String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'Riyazur Rohman Kawchar'))
          .then((value) {});

      displayPaymentSheet(context);

    } catch (e, s) {
    }
  }



  displayPaymentSheet(BuildContext context) async {
    AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async{
        bool value=await FirebaseFireStoreHelper.instance.uploadOrderProductFirebase(appProvider.getBuyProductList, context, 'Paid');
           appProvider.clearBuyProduct();

        if (value) {
          Future.delayed(const Duration(seconds: 2), () {
            Routes.push(
                context: context, page: const CustomBottomNavbar());
          });
        }
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      Text("Payment Successful"),
                    ],
                  ),
                ],
              ),
            ));
        paymentIntent = {};
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (error) {
      // ignore: avoid_print
      print('error charging user: ${error.toString()}');
    }
  }



}