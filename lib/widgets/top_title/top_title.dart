import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title,subtitle;
  const TopTitle({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight,
        ),
       if(title=="Login" || title=='Create Account')
        InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child:const Icon(Icons.arrow_back_ios_new)),
         const SizedBox(height: 20,),
         Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(
          height: 12,
        ),
         Text(subtitle,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Raleway',
            )),
      ],
    );
  }
}
