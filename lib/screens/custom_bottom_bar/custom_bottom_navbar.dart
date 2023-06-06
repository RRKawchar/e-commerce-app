import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/screens/accounts/account_screen.dart';
import 'package:e_commerce_app/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/screens/favourite/favorite_screen.dart';
import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const AccountScreen(),
  ];
  int currentIndex = 0;

  void onTap(value){
    setState(() {
      currentIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        elevation: 1,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        type:  BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap:onTap
      ),
    );
  }
}
