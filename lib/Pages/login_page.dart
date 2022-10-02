import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButtton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButtton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButtton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: [
            Image.asset(
              "assets/images/login_image2.jpg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value==null||value.isEmpty) {
                        return "Nam kya tera baap rkhega";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value==null||value.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password length badha mc";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    //it gives a ripple effect to the button
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButtton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButtton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius:
                            BorderRadius.circular(changeButtton ? 50 : 8),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     print('Hi Sundaram');
                  //     Navigator.pushNamed(context, MyRoutes.HomeRoute);
                  //   },
                  //   child: Text("LOGIN"),
                  //   style: TextButton.styleFrom(
                  //     minimumSize: Size(150, 40),
                  //   ),
                  // )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}


//class blueprint hai aur andar objects hote hai