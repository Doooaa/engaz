import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:engaz/core/constants/sharedWidgets.dart';
// import 'package:engaz/screens/login&Register/wedigets.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   var email = TextEditingController();

//   var test = TextEditingController();

//   String password = '';
//   var pass = TextEditingController();
//   bool isPasswordVisible = true;

//   var formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();

//     email.addListener(() => setState(() {}));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Pr',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Text(
//               'e',
//               style: TextStyle(
//                 fontSize: 50.0,
//                 decoration: TextDecoration.underline,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               'sent',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: Colors.amber,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(
//           top: 20,
//           left: 20,
//           right: 20,
//           bottom: 20,
//         ),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               const Column(
//                 children:  [
//                   Text(
//                     'Log in',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 55.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     'Welcome back!',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               /*email*/ textField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: email,
//                 hinttext: 'Email or Phone number',
//                 suffixIcon: email.text.isEmpty
//                     ? Container(width: 0)
//                     : IconButton(
//                         icon: const Icon(Icons.close, size: 20.0, color: Colors.black),
//                         onPressed: () => email.clear(),
//                       ),
//               ),
//               const SizedBox(height: 10),
//               /*password*/ textField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: pass,
//                 hinttext: 'Email or Phone number',
//                 isPassword: true,
//                 suffixIcon: pass.text.isEmpty
//                     ? Container(width: 0)
//                     : IconButton(
//                         icon: isPasswordVisible
//                             ? const Icon(Icons.visibility_off, size: 20.0, color: Colors.black)
//                             : const Icon(Icons.visibility, size: 20.0, color: Colors.black),
//                         onPressed: () => setState(
//                           () => isPasswordVisible = !isPasswordVisible,
//                         ),
//                       ),
//                 onChange: (value) => setState(() => password = value),
//                 isPasswordVisible: isPasswordVisible,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   TextButton(
//                     child: const Text(
//                       'Forgot password?',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               /*login*/ commonButton(
//                 text: 'Log In',
//                 function: () => {if (formKey.currentState!.validate()) {
                  
//                 }},
//                 fontsize: 25.0,
//               ),
//               const SizedBox(height: 20),
//               ),
//       ),
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login&register/light-1.png'))
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/enjez.png', // Replace with your app logo
                  height: 120.0,
                ),
                SizedBox(height: 32.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'اسم المستخدم ',
                          prefixIcon: Icon(Iconsax.user),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'كلمه المرور',
                          prefixIcon: Icon(Iconsax.lock),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text('تسجيل دخول'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Process login with _username and _password
      print('Login successful! Username: $_username, Password: $_password');
    }
  }
}