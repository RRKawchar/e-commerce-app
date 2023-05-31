import 'package:e_commerce_app/constants/colors.dart';
import 'package:e_commerce_app/model/product_model/product_model.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:e_commerce_app/widgets/top_title/top_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopTitle(
                    title: "Shopping Here",
                    subtitle: "",
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Search...."),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: 'Categories',
                size: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Column(
                      children: [
                        Card(
                          elevation: 8,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              category['image'].toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        CustomText(
                          text: category['name'],
                          maxLine: 2,
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: 'Popular Food',
                size: 18,
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 12,),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: popularProduct.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5
              ),
                  itemBuilder:(context,index){
                    ProductModel product=popularProduct[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 2
                      )
                    ),
                    child: Column(
                      children: [
                        Image.network(product.image.toString(),width: 100,
                        height: 100,),
                        const SizedBox(height: 10,),
                        CustomText(text: "price:\$${product.price}"),
                        const SizedBox(height: 10,),
                        OutlinedButton(onPressed: (){}, child: const CustomText(text: "Buy",))
                      ],
                    ),

                  );
                  }

              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> categories = [
  {
    "image":
        "https://i.pinimg.com/originals/6c/ee/58/6cee589c2f553320ee93e5afced09766.png",
    "name": "Burger"
  },
  {
    "image":
        "https://www.freepnglogos.com/uploads/fried-chicken-png/crispy-fried-chicken-png-0.png",
    "name": "Chicken Fry"
  },
  {
    "image":
        "https://static.vecteezy.com/system/resources/previews/021/952/443/non_2x/southern-fried-chicken-fried-chicken-transparent-background-png.png",
    "name": "Meat Fry"
  },
  {
    "image":
        "https://graficsea.com/wp-content/uploads/2022/02/Deep-Fried-Fish-.png",
    "name": "Deep Fried Fish"
  },
  {
    "image":
        "https://www.kfc-suisse.ch/fileadmin/media/images/Produkte/Buckets/thumb_family_friends_bucket.png",
    "name": "KFC suisse"
  },
  {
    "image": "https://www.seekpng.com/png/full/816-8165505_beef-fry-png.png",
    "name": "Beef Fry"
  },
];

List<ProductModel> popularProduct = [
  ProductModel(
    image:
        'https://www.freepnglogos.com/uploads/pineapple-png/pineapple-bananas-and-coffee-jackie-ecological-12.png',
    id: '1',
    name: 'Pineapple',
    price: '40',
    description:
        "Pineapples have a cylindrical shape with a tough, spiky, and brownish outer skin. Inside, they have "
        "a juicy, yellow to golden flesh that is divided into multiple sections.",
    status: 'Pending',
    isFavorite: false,
  ),
  ProductModel(
    image:
        'https://www.pngkey.com/png/full/932-9328480_apples-png-image-red-apple-fruit.png',
    id: '2',
    name: 'Pineapple',
    price: '250',
    description:
        """ Apples come in a wide variety of colors, shapes, sizes, and flavors. Common varieties include Red Delicious, 
    Granny Smith, Gala, Fuji, and Golden Delicious. Each variety has
     its own unique characteristics in terms of taste, texture, and appearance.
    Taste and Texture: Apples can range in flavor from sweet to tart. Some varieties are crisp and juicy, 
     while others have a softer texture. The taste and texture of apples can vary depending on factors such as the variety, 
     growing conditions, and ripeness.""",
    status: 'Pending',
    isFavorite: false,
  ),
  ProductModel(
    image:
        'https://purepng.com/public/uploads/large/purepng.com-lycheefruitslycheelitchiliecheelizhili-zhilichee-981525183308x0ogy.png',
    id: '3',
    name: 'Lychee',
    price: '350',
    description:
        "Lychees have a unique appearance with rough, textured, and reddish-brown outer skin. "
            "The skin is thin and easily peels away to reveal the translucent, juicy flesh inside."
            " The flesh is whitish or pinkish, and each lychee contains a single seed in the center.",
    status: 'Pending',
    isFavorite: false,
  ),
  ProductModel(
    image:
        'https://www.pngplay.com/wp-content/uploads/10/Jackfruit-PNG-Clipart-Background-1.png',
    id: '4',
    name: 'JackFruit',
    price: '300',
    description:
        " Jackfruit is one of the largest fruits in the world, with some weighing up to 80 pounds "
            "(36 kilograms). The fruit has a thick, rough, and bumpy outer skin. Inside, it is divided into multiple segments or "
            "bulbs, which contain edible flesh and seeds.",
    status: 'Pending',
    isFavorite: false,
  ),
  ProductModel(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Banana.png/836px-Banana.png',
    id: '5',
    name: 'Banana',
    price: '40',
    description:
        "Bananas are elongated fruits with a distinctive curved shape. They have a thick,"
            " yellow skin that is easily peeled to reveal the soft, creamy flesh inside. "
            "The flesh is usually pale yellow but can vary in color, ranging from green to deep yellow.",
    status: 'Pending',
    isFavorite: false,
  ),
  ProductModel(
    image:
        'https://www.freepnglogos.com/uploads/watermelon-png/watermelon-primal-shisha-gels-primal-brands-13.png',
    id: '6',
    name: 'Watermelon',
    price: '180',
    description:
        "Watermelon is a refreshing and juicy fruit known for"
            " its high water content and sweet flavor. It belongs to the Cucurbitaceae family and is scientifically known as"
            " Citrullus lanatus. Watermelon is believed to have originated in Africa and is now cultivated in many countries around the world."
            "Here are some key points about watermelon:"
            "Appearance: Watermelons have a large, oval or round shape and can"
            "",
    status: 'Pending',
    isFavorite: false,
  ),
];
