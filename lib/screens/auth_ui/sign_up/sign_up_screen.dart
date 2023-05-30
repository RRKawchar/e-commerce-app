import 'package:e_commerce_app/constants/assets_images.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/screens/auth_ui/login/login_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitle(
                  title: 'Create Account', subtitle: "Welcome to E-Commerce"),
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
                        icon: isShowPass?const Icon(Icons.visibility):const Icon(Icons.visibility_off))),
              ),
              const SizedBox(
                height: 12.0,
              ),
              PrimaryButton(
                title: 'Create Account',
                onPressed: () {
                  Routes.push(context: context, page: const HomeScreen());
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
