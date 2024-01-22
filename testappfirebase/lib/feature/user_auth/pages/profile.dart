import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:testappfirebase/feature/user_auth/firebase_auth/firebase_auth_service.dart';
import 'package:testappfirebase/feature/user_auth/pages/login_page.dart';

import 'package:testappfirebase/widget/button_widget.dart';

import '../../../widget/form_container_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPictureProfile(),
            const SizedBox(height: 10),
            TextFieldWidget(
              controller: FirebaseAuthService.nameController,
              hintText: "Name",
            ),
            TextFieldWidget(
              controller: FirebaseAuthService.emailController,
              hintText: "Email",
              inputType: TextInputType.emailAddress,
            ),
            const Divider(),
            ButtonWidget(
              onTap: () async {
                String name = FirebaseAuthService.nameController.text;
                String email = FirebaseAuthService.emailController.text;
                await FirebaseAuthService.saveData(
                    name: name, email: email, file: _image!);
              },
              title: 'Save',
            ),
            // const Spacer(),
            buildFooter(context),
          ],
        ),
      ),
    );
  }

  void saveProfile() {
    // String name = FirebaseAuthService.nameController.text;
    // String email = FirebaseAuthService.emailController.text;
  }

  Widget buildPictureProfile() {
    return Stack(
      children: [
        SizedBox(
          child: _image != null
              ? CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(_image!),
                )
              : const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.amber,
                ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () async {
                File? img =
                    await FirebaseAuthService.pickImage(ImageSource.gallery);
                setState(() {
                  _image = img;
                });
              },
              icon: const Icon(Icons.add_a_photo),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          },
          child: const Text(
            "back",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
