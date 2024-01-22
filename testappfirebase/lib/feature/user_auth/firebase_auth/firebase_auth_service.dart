import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testappfirebase/widget/snackbar_widget.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseAuthService {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var verificationID = '';

  static String avatar = '';

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {}
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {}
    }
    return null;
  }

  Future<User?> verifyUserPhoneNumber(
    String phoneNumber,
    String verificationId,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (verificationId) {},
    );
    return null;
  }

  Future<bool> verifyOTP(String otp) async {
    await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otp,
      ),
    );
    return true;
  }

  static Future<File?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      var direction = await getApplicationDocumentsDirectory();

      print("test ${direction.absolute} + ${file.path}");
      return File(file.path);
    }
    print("No image");
    return null;
  }

  static Future<String> uploadImageStorage(String childName, File file) async {
    Reference ref = _storage.ref().child(childName);
    final metadata =
        SettableMetadata(contentType: "image/${file.path.split('.').last}");
    UploadTask uploadTask = ref.putFile(file, metadata);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    print("Hoang 1 ${downloadUrl.toString()}");
    return downloadUrl;
  }

  static Future<String> saveData({
    required String name,
    required String email,
    required File file,
  }) async {
    String resp = " Some Error";
    try {
      String imageUrl = await uploadImageStorage(
          "userImage/${DateTime.now()}.${file.path.split('.').last}", file);
      await _firestore.collection('userProfile').add({
        'name': name,
        'email': email,
        'imageLink': imageUrl,
      });
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
