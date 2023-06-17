import 'package:e_commerce_app/constants/assets_images.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/screens/auth_ui/login/login_screen.dart';
import 'package:e_commerce_app/screens/auth_ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_app/widgets/top_title/top_title.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TopTitle(title: 'Welcome', subtitle: 'Buy any Tech Product from this Tech Stacks App'),
            Center(
                child: Image.asset(
              AssetsImages.welcomeImage,
              width: 280,
            )),
            const SizedBox(height: 20.0,),
            PrimaryButton(title: "Login",onPressed: (){
             Routes.push(context: context, page: const LoginScreen());
            },),
            const SizedBox(height: 20.0,),
            PrimaryButton(title: "Sign Up",onPressed: (){
             Routes.push(context: context, page: const SignUpScreen());
            },)
          ],
        ),
      ),
    );
  }
}
