import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPass = false;
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Change Password",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          TextFormField(
            controller: newPassword,
            obscureText: isShowPass,
            decoration: InputDecoration(
                hintText: "New Password",
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
          TextFormField(
            controller: confirmPassword,
            obscureText: isShowPass,
            decoration: InputDecoration(
                hintText: "Confirm Password",
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
              onPressed: () async {
                if (newPassword.text.isEmpty) {
                  showMessage(message: 'New password is empty');
                } else if (confirmPassword.text.isEmpty) {
                  showMessage(message: 'Confirm password is empty');
                } else {
                  if (confirmPassword.text == newPassword.text) {
                    FirebaseAuthHelper.instance.changePassword(
                        password: newPassword.text, context: context);
                  } else {
                    showMessage(message: 'Confirm password is not match');
                  }
                }
              },
              title: 'Update')
        ],
      ),
    );
  }
}
