import 'package:e_commerce_app/constants/assets_images.dart';
import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/screens/auth_ui/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:e_commerce_app/widgets/top_title/top_title.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                title: 'Login',
                onPressed: () {},
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
