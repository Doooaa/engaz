import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/login&register/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/login&register/light-1.png'))),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1200),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/login&register/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1300),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1800),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromRGBO(30, 158, 141, 1)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(31, 142, 137, 0.2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  30, 158, 141, 1)))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700])),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1900),
                          child: InkWell(
                            onTap: () {

                                    Navigator.pushNamed(context, '/');
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(88, 211, 182, 1),
                                    Color.fromRGBO(59, 154, 132, 1)
                                  ])),
                              child: const Center(
                                child: Text(
                                  "تسجيل دخول",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 70,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 2000),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(88, 211, 182, 1)),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: FadeInUp(
                              duration: const Duration(milliseconds: 2000),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Color.fromRGBO(88, 211, 182, 1)),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
