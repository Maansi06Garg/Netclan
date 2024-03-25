import 'package:flutter/material.dart';
import 'package:netclan/screens/HomePage.dart';
import 'package:netclan/screens/Profile.dart';
import '../utils/Routes.dart';
// import '../screens/Signup.dart';
// import '../screens/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context)=>const HomePage(),
          // MyRoutes.SignUpRoutes: (context) => const SignUp(),
          // MyRoutes.LoginRoutes: (context) => Login(),
          MyRoutes.ProfileRoutes: (context) => Detail(),
          MyRoutes.HomeRoutes: (context) => HomePage(),

        }
    );
  }
}

