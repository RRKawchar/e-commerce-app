import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "About us",),
        centerTitle: true,
      ),
      body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [
          CustomText(text: "Introducing",size: 30,),
          SizedBox(height: 20,),
          CustomText(text: "TechGear app, your ultimate destination for all your tech needs."
      " Discover a seamless shopping experience like never before as we bring you an extensive range of laptops, "
        "mice, keyboards, and more, right at your fingertips."
              " At TechGear, we understand the importance of finding the perfect tech gear"
              " that fits your requirements and style. With our user-friendly interface and intuitive design,"
              " you can effortlessly browse through a vast selection of high-quality products from renowned brands.",
            fontWeight: FontWeight.bold,),
          SizedBox(height: 20,),
          CustomText(text: "Key Features:",size: 30,),
          SizedBox(height: 20,),
          CustomText(text: "Extensive Product Collection: Explore a diverse range of "
              "laptops, mice, keyboards, and other tech accessories, handpicked to cater to "
              "your specific needs. From cutting-edge gaming laptops to sleek and portable workstations, we have it all.",),
          SizedBox(height: 10,),
          CustomText(text: "Seamless Navigation: Our app is designed to make your shopping experience hassle-free."
              " Effortlessly navigate through categories, apply filters, "
              "and sort products based on your preferences. Finding the perfect device is now just a few taps away.",),
          SizedBox(height: 10,),
          CustomText(text: "Personalized Recommendations: We understand that everyone has unique preferences. "
              "That's why our app utilizes advanced algorithms to provide personalized recommendations based on your browsing"
              " history and previous purchases. Discover new products that align with your interests.",),
          SizedBox(height: 10,),
          CustomText(text: "User Reviews and Ratings: Make informed purchase decisions by reading authentic"
              " user reviews and ratings. Get insights "
              "from fellow tech enthusiasts who have already experienced the products firsthand.",),



        ],
      ),
    );
  }
}
