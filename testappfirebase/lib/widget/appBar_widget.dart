import 'package:flutter/material.dart';
import 'package:testappfirebase/feature/user_auth/pages/login_page.dart';

class AppBarWidget extends StatelessWidget   {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(title),
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
      ),
    );
  }
}
