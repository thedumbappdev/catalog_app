import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login Screen",
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.w500,
          ),
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
