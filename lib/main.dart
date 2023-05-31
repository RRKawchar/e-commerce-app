import 'package:e_commerce_app/constants/themes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_app/firebase_helper/firebase_options/firebase_options.dart';
import 'package:e_commerce_app/screens/auth_ui/welcome/welcome_screen.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platFromOptions
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const HomeScreen();
          }else{
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}


