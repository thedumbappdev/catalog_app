import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/home.dart';
import './screens/login.dart';
import 'package:catalog_app/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
      },
    );
  }
}
