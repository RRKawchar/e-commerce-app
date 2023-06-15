import 'package:e_commerce_app/constants/themes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_app/firebase_helper/firebase_options/firebase_options.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/auth_ui/welcome/welcome_screen.dart';
import 'package:e_commerce_app/screens/custom_bottom_bar/custom_bottom_navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
  "pk_test_51MvYuoCggqKRrymtfxt4Zpz5BmuWZfyaNykSKSqixq6IyvxhHbxzgvD31uoVWDmfEt6oQVeIDaoHQbKAczQJRViW000sFU0UQw";
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platFromOptions
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return const CustomBottomNavbar();
            }else{
              return const WelcomeScreen();
            }
          },
        ),
      ),
    );
  }
}


