import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/snack_bar_utils.dart';

class LoginController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        Get.toNamed(Routes.HOME);
        await firebaseAuth.signInWithCredential(credential);
        print(firebaseAuth.currentUser!.email);
      }
    } catch (e) {}
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarUtils.showBaseSnackBar("Error", "Invalid email or password.");
      } else {
        SnackBarUtils.showBaseSnackBar("Error", "Email & Password not correct");
      }
    }
    return null;
  }
}
