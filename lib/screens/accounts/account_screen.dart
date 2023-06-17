import 'package:e_commerce_app/constants/routes.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/screens/about_us/about_us.dart';
import 'package:e_commerce_app/screens/change_password/change_password.dart';
import 'package:e_commerce_app/screens/edit_profile/edit_profile.dart';
import 'package:e_commerce_app/screens/favourite/favorite_screen.dart';
import 'package:e_commerce_app/screens/order_scren/order_screen.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Account",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
                children: [
                  provider.getUserInformation.image.isEmpty
                      ? const Icon(
                          Icons.person_outline,
                          size: 120,
                        )
                      :  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(provider.getUserInformation.image),
                  ),
                  CustomText(
                    text: provider.getUserInformation.name,
                    size: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(text: provider.getUserInformation.email.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 130,
                    child: PrimaryButton(onPressed: () {
                      Routes.push(context: context, page: const EditProfile());
                    }, title: "Edit Profile"),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Routes.push(context: context, page: const OrderScreen());
                    },
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const CustomText(
                      text: "Your Orders",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.push(context: context, page:const FavoriteScreen());
                    },
                    leading: const Icon(Icons.favorite_outline),
                    title: const CustomText(
                      text: "Favorites",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.push(context: context, page:const AboutUsScreen());
                    },
                    leading: const Icon(Icons.info_outline),
                    title: const CustomText(
                      text: "About us",
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.support_outlined),
                    title: const CustomText(
                      text: "Support",
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.push(context: context, page:const ChangePassword());
                    },
                    leading: const Icon(Icons.change_circle_outlined),
                    title: const CustomText(
                      text: "Change Password",
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      setState(() {});
                    },
                    leading: const Icon(Icons.logout),
                    title: const CustomText(
                      text: "Log out",
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CustomText(text: "Version: 1.0.0")
                ],
              )),
        ],
      ),
    );
  }
}
