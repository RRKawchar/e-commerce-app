// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/constants/assets_images.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_app/screens/auth_ui/login/login_screen.dart';
import 'package:e_commerce_app/screens/custom_bottom_bar/custom_bottom_navbar.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_app/widgets/top_title/top_title.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isShowPass = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              const TopTitle(
                  title: 'Create Account', subtitle: "Welcome to our Tech Stacks App"),
              const SizedBox(
                height: 12,
              ),
              Center(
                  child: Image.asset(
                AssetsImages.signuplogo,
                width: 150,
              )),
              const SizedBox(
                height: 40.0,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person,
                      size: 30,
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone",
                    prefixIcon: Icon(
                      Icons.phone,
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
                title: 'Create Account',
                onPressed: () async {
                  bool isValid = signUpValidation(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                      phoneController.text);
                  if (isValid) {
                    bool isSignUp = await FirebaseAuthHelper.instance.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        context: context);
                    if(isSignUp){
                      Routes.pushAndRemoveUntil(context: context, page:const CustomBottomNavbar());
                    }
                  }
                },
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Center(child: Text("Already have an account!")),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Routes.push(context: context, page: const LoginScreen());
                  },
                  child: Text(
                    'Login',
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
