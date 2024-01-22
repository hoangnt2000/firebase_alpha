// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:testappfirebase/feature/user_auth/pages/home.dart';
import 'package:testappfirebase/feature/user_auth/pages/login_page.dart';
import 'package:testappfirebase/widget/form_container_widget.dart';

class PhoneOTPVerification extends StatefulWidget {
  const PhoneOTPVerification({super.key});

  @override
  State<PhoneOTPVerification> createState() => _PhoneOTPVerificationState();
}

class _PhoneOTPVerificationState extends State<PhoneOTPVerification> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  bool visible = false;
  var temp;

  @override
  void dispose() {
    phoneNumber.dispose();
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign in With Phone Number"),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Container(
                padding: const EdgeInsets.all(16),
                child: const Icon(Icons.arrow_back)),
          )),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextFieldWidget(
              hintText: "Phone number",
              inputType: TextInputType.number,
            ),
            SizedBox(
              height: 50,
            ),
            visible ? TextfieldOTP() : const SizedBox(),
            !visible ? SendOTPButton("Send OTP") : SubmitOTPButton("Submit"),
          ],
        ),
      ),
    );
  }

  Widget SendOTPButton(String text) => ElevatedButton(
        onPressed: () async {
          setState(() {
            visible = !visible;
          });
          // temp = await FirebaseAuthentication().sendOTP(phoneNumber.text);
        },
        child: Text(text),
      );
  Widget TextfieldOTP() {
    return OtpTextField(
      numberOfFields: 5,
      borderColor: Color(0xFF512DA8),
      showFieldAsBox: false,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {},
      autoFocus: true,
    );
  }

  Widget SubmitOTPButton(String text) => ElevatedButton(
        onPressed: () {
          // FirebaseAuthentication().authenticate(temp, otp.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Text(text),
      );
}

class FirebaseAuthentication {
  late String phoneNumber;

  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(phoneNumber);
    return result;
  }

  authenticate(ConfirmationResult confirmationResult, String otp) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);
    userCredential.additionalUserInfo!.isNewUser
        ? printMessage("Authentication Successful")
        : printMessage("User already exists");
  }

  printMessage(String msg) {
    debugPrint(msg);
  }
}
