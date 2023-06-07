import 'dart:io';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/firebase_helper/firebase_storage_helper/firebase_storage_helpers.dart';
import 'package:e_commerce_app/model/user_model/user_model.dart';
import 'package:e_commerce_app/provider/app_provider.dart';
import 'package:e_commerce_app/widgets/custom_text/custom_text.dart';
import 'package:e_commerce_app/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker=ImagePicker();
  File? _image;
  void pickImage()async{
    XFile? file=await _picker.pickImage(source: ImageSource.gallery);
     if(file!=null){
       setState(() {
         _image=File(file.path);
       });
     }
  }

  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider provider=Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:  const CustomText(text: "Profile",),
        centerTitle: true,
      ),
      body: ListView(
        padding:  const EdgeInsets.symmetric(horizontal: 20.0),
        children:  [
          _image==null? InkWell(
            onTap: (){
              pickImage();
            },
            child: const CircleAvatar(
              radius: 70,
              child: Icon(Icons.camera_alt,size: 35,),
            ),
          ):InkWell(
            onTap: (){
              pickImage();
            },
            child: CircleAvatar(
              radius: 70,
             backgroundImage: FileImage(_image!),
            ),
          ),
          const SizedBox(height: 25.0,),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: provider.getUserInformation.name
            ),
          ),
           const SizedBox(height: 12.0,),
           PrimaryButton(
              onPressed: ()async{
               UserModel userModel= provider.getUserInformation.copyWith(name: nameController.text);
               provider.updateUserInfoFirebase(context, userModel, _image);
              },
              title: 'Update')
        ],
      ),
    );
  }
}
