import 'package:e_commerce_app/constants/assets_images.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/screens/auth_ui/login/login_screen.dart';
import 'package:e_commerce_app/screens/auth_ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_app/widgets/top_title/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopTitle(title: 'Welcome', subtitle: 'Buy any Grocery Prodcut from this app'),
            Center(
                child: Image.asset(
              AssetsImages.welcomeImage,
              width: 280,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 40,
                    )),
                const SizedBox(
                  width: 12.0,
                ),
                CupertinoButton(
                    onPressed: () {},
                    child: Image.asset(
                      AssetsImages.googleLogo,
                      height: 32,
                    ))
              ],
            ),
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
