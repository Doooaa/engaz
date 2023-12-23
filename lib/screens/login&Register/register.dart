import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';
import 'package:engaz/screens/login&Register/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
    TextEditingController _Namecontroller=TextEditingController();
    TextEditingController _passwordController=TextEditingController();
    TextEditingController _phoneController=TextEditingController();
    TextEditingController _emailController=TextEditingController();
    TextEditingController _currrentAdressController=TextEditingController();

    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(167, 0, 150, 135),
              myColor,
              const Color.fromARGB(197, 3, 102, 92),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22, right: 22),
            child: Text(
              'مرحبا بك\n تسجيل حساب جديد!',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: _Namecontroller,
                          decoration: const InputDecoration(
                            hintText: 'اسم المستخدم ',
                            prefixIcon: Icon(Iconsax.user),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '  من فضلك ادخل الاسم   ';
                            }
                            return null;
                          },
                         
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'كلمة المرور',
                            prefixIcon: Icon(Iconsax.lock),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '  من فضلك ادخل كلمة المرور';
                            }
                            return null;
                          },
                        
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: "رقم الموبايل",
                            prefixIcon: Icon(Iconsax.call),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '  من فضلك ادخل كلمة المرور';
                            }
                            return null;
                          },
                        
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'البريد الالكتروني',
                            prefixIcon: Icon(Iconsax.sms),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '  من فضلك ادخل البريد الالكتروني ';
                            }
                            return null;
                          },
                        
                        ),
                          const SizedBox(height: 10.0),
                         TextFormField(
                          controller: _currrentAdressController,
                          decoration: const InputDecoration(
                            hintText: "العنوان",
                            prefixIcon: Icon(Iconsax.location),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '  من فضلك ادخل كلمة المرور';
                            }
                            return null;
                          },
                        
                        ),
                        const SizedBox(height: 35.0),
                        Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(200, 83, 154, 137),
                              Colors.teal,
                              Color.fromARGB(197, 3, 102, 92),
                            ]),
                          ),
                          child: TextButton(
                            onPressed: () {
                    
                              if (_formKey.currentState!.validate()) {
                                {

                                  navigateToAndRemove(
                                      context, loginScreen());
                                }
                              }
                            },
                            child: const Text(
                              'تسجيل حساب',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              " لديك حساب بالفعل ؟ ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateToAndRemove(context, loginScreen());
                              },
                              child: Text(
                                "سجل دخول",
                                style: TextStyle(color: myColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
