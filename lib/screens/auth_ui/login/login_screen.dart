// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/constants/assets_images.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_app/screens/auth_ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_app/widgets/top_title/top_title.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight,),
              const TopTitle(
                  title: 'Login', subtitle: "Welcome Back to E-Commerce app"),
              const SizedBox(
                height: 12,
              ),
              Center(
                  child: Image.asset(
                AssetsImages.loginLogo,
                width: 250,
              )),
              const SizedBox(
                height: 40.0,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "E-mail",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      size: 30,
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: isShowPass,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.password_sharp,
                      size: 30,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPass = !isShowPass;
                          });
                        },
                        icon: isShowPass
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off))),
              ),
              const SizedBox(
                height: 12.0,
              ),
              PrimaryButton(
                title: 'Login',
                onPressed: () async {
                  bool isValid = loginValidation(
                      emailController.text, passwordController.text);
                  if (isValid) {
                    bool isLogin = await FirebaseAuthHelper.instance.login(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context,
                    );
                    if(isLogin){
                      Routes.pushAndRemoveUntil(context: context, page:const HomeScreen());
                    }
                  }
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Center(child: Text("Don't have any account?")),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Routes.push(context: context, page: const SignUpScreen());
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
