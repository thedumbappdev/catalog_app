import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/login_img.png",
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome $username",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                      ),
                      onChanged: (value){
                        username = value;
                        setState(() {
                          
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: Text(
                        'Login',
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(150, 42)),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
