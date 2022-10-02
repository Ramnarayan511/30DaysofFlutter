import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/home_page.dart';
import 'package:flutter_catalog/Pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.lato().fontFamily,
        
        ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.HomeRoute,
      routes: {//routes shows path for diff pages
        "/": (context) => LoginPage(),
        MyRoutes.HomeRoute:(context) => HomePage(),
        MyRoutes.loginRoute:(context) => LoginPage()
      },
    );
  }

  // bringVegetables({int rupees=100,@required bool thaila}){
  //   //Take cycle

  //   //Go to sec 16
  // }
  // {} -> value dei pariba nahele 100 initialize hebo 



}
