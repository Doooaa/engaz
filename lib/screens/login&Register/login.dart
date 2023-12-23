import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';
import 'package:engaz/screens/login&Register/register.dart';
import 'package:engaz/screens/homeLayout/shopLayout(home).dart';

final _formKey = GlobalKey<FormState>();
// import 'package:flutter/material.dart';
// import 'package:engaz/core/constants/sharedWidgets.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late String _username;
//   late String _password;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double viewInset = MediaQuery.of(context)
//         .viewInsets
//         .bottom; // we are using this to determine Keyboard is opened or not
//     double defaultLoginSize = size.height - (size.height * 0.2);
//     double defaultRegisterSize = size.height - (size.height * 0.1);
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/login&register/light-1.png'))),
//         padding: EdgeInsets.all(16.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   height: MediaQuery.sizeOf(context).height * 0.2,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(
//                     'assets/images/enjez.png',
//                   ))),
//                 ),

//                 const SizedBox(height: 32.0),
//                 Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           decoration: const InputDecoration(
//                               border: InputBorder.none,
//                             hintText: 'اسم المستخدم ',
//                             prefixIcon: Icon(Iconsax.user),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return '  من فضلك ادخل الاسم   ';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             _username = value!;
//                           },
//                         ),
//                         const SizedBox(height: 16.0),
//                         TextFormField(
//                           decoration: const InputDecoration(
//                             hintText: 'كلمة المرور',
//                             prefixIcon: Icon(Iconsax.lock),
//                           ),
//                           obscureText: true,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return  '  من فضلك ادخل كلمة المرور';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             _password = value!;
//                           },
//                         ),
//                         const SizedBox(height: 32.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             _submitForm();
//                           },
//                           child: Text('تسجيل دخول'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

void _submitForm() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    // Process login with _username and _password
    print('Login successful! Username: $_username, Password: $_password');
  }
}

late String _username;
late String _password;

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(167, 0, 150, 135),
              myColor,
              Color.fromARGB(197, 3, 102, 92),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22, right: 22),
            child: Text(
              'مرحبا بك\n تسجيل الدخول!',
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
                          onSaved: (value) {
                            _username = value!;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
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
                          onSaved: (value) {
                            _password = value!;
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
                              _submitForm();
                              if (_formKey.currentState!.validate()) {
                                {
                                  
                                  navigateToAndRemove(
                                      context, HomeLayoutScreen());
                                }
                              }
                            },
                            child: const Text(
                              'تسجيل دخول',
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
                              "ليس لديك حساب ؟ ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateToAndRemove(context, Register());
                              },
                              child: Text(
                                "انشاء حساب",
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
