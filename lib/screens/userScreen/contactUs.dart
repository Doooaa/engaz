import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';

var _formKey = GlobalKey<FormState>();

TextEditingController _Namecontroller = TextEditingController();

TextEditingController _phonecontroller = TextEditingController();

TextEditingController _addresscontroller = TextEditingController();

TextEditingController _descriptioncontroller = TextEditingController();

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor,
          title: const Text('تواصل معنا'),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              // image: DecorationImage(image: AssetImage('assets/images/teal_back.jpg'),),
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //   Color.fromARGB(255, 209, 255, 242),
              const Color.fromARGB(255, 165, 180, 176),
              myColor,
              Colors.tealAccent,
              const Color.fromARGB(255, 165, 180, 176)
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(241, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 174, 172, 172)
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: _Namecontroller,
                              // ignore: non_constant_identifier_names
                              validator: (Value) {
                                String? value = Value;
                                if (value!.trim().isEmpty) {
                                  return ' من فضلك اضف الاسم ';
                                } else if (value.trim().length < 6) {
                                  return ' من فضلك اضف الاسم باكامل ';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Iconsax.user,
                                ),
                                labelText: 'الاسم بالكامل',
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ادخل البريد الالكتروني';
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value))
                                  return 'ادخل  بريد الكتروني صحيح';
                                return null;
                              },
                              controller: _phonecontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.sms),
                                labelText: 'الايميل',
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              maxLines: 4,
                              onChanged: (value) {},
                              controller: _descriptioncontroller,
                              validator: (Value) {
                                String? value = Value;
                                if (value!.trim().isEmpty) {
                                  return 'الرسالة فارغه';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.document_text),
                                labelText: 'الرسالة',
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            SizedBox(
                              height: 40,
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: myColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12), // Adjust the border radius as needed
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    showtoast(
                                      context: context,
                                      Message: 'تم ارسال الرسالة بنجاح',
                                      color: Colors.green[600],
                                    );
                                  }
                                },
                                child: const Text(
                                  ' ارسال ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )),
                ),
                // Image.asset('assets/images/teal_back.jpg'),
                SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(Uri.parse('https://www.facebook.com/example'));
                  },
                  icon: Icon(
                    Icons.facebook,
                    color: myColor,
                  ),
                  label: Text(
                    'Facebook',
                    style: TextStyle(
                      color: myColor,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(Uri.parse('https://github.com'));
                  },
                  icon: Icon(
                    Icons.email_outlined,
                    color: myColor,
                  ),
                  label: Text(
                    'email',
                    style: TextStyle(
                      color: myColor,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
