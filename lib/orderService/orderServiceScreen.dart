import 'dart:ui';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:engaz/sharedWidgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:engaz/orderService/widgets_orders.dart';

class orderServiceScreen extends StatefulWidget {
  String? WorkerIamge, WorkerName;

  orderServiceScreen([this.WorkerIamge, this.WorkerName]);

  @override
  State<orderServiceScreen> createState() => _orderServiceScreenState();
}

class _orderServiceScreenState extends State<orderServiceScreen> {
  String? imageName;
  final _picker = ImagePicker();

  Future<void> _getImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageName = pickedImage.name;
      });
    }
  }

  var _formKey = GlobalKey<FormState>();

  TextEditingController _Namecontroller = TextEditingController();

  TextEditingController _phonecontroller = TextEditingController();

  TextEditingController _addresscontroller = TextEditingController();

  TextEditingController _descriptioncontroller = TextEditingController();

  // TextEditingController _imagecontroller = TextEditingController();
   String? selectedAddress ;
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor,
          title: const Text('اطلب الان'),
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
                // Image.asset('assets/images/teal_back.jpg'),
                ClipOval(
                    child: Image.asset(
                  widget.WorkerIamge.toString(),
                  width: 140, 
                  height: 140, 
                  fit: BoxFit.cover,
                )),
                Text(widget.WorkerName ?? 'نجار',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: WhiteColor,
                          fontSize: 18,
                        )),
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
                              keyboardType: TextInputType.phone,
                              validator: (Value) {
                                String? value = Value;
                                if (value!.trim().isEmpty) {
                                  return 'من فضلك اضف رقم الموبايل ';
                                }
                                return null;
                              },
                              controller: _phonecontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.call),
                                labelText: 'رقم الموبايل',
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            DropdownButtonFormField<String>(
                             value: selectedAddress,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedAddress = newValue!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'من فضلك اختر المحافظه';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.location),
                                labelText: 'العنوان',
                              ),
                              items: addresses.map((String address) {
                                return DropdownMenuItem<String>(
                                  value: address,
                                  child: Text(address),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.streetAddress,
                              validator: (Value) {
                                String? value = Value;
                                if (value!.trim().isEmpty) {
                                  return 'من فضلك اضف عنوانك ';
                                }
                                return null;
                              },
                              controller: _addresscontroller,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.location),
                                labelText: 'المركز -المنطقة',
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              onChanged: (value) {},
                              controller: _descriptioncontroller,
                              validator: (Value) {
                                String? value = Value;
                                if (value!.trim().isEmpty ||
                                    value.trim().length < 10) {
                                  return 'من فضلك اضف وصف كامل للمشكلة';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.document_text),
                                labelText: 'وصف المشكلة ',
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '    ${imageName ?? "الرجاء رفع صورة المشكله       "}',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                IconButton(
                                    onPressed: _getImage,
                                    icon: Icon(
                                      Iconsax.document_upload,
                                      color: myColor,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            sendOrderButton(
                                formKey: _formKey,
                                widget: widget,
                                Namecontroller: _Namecontroller,
                                phonecontroller: _phonecontroller,
                                addresscontroller: _addresscontroller,
                                descriptioncontroller: _descriptioncontroller,
                               // cityAdress,
                               imageName:imageName,
                                ),
                            const SizedBox(
                              height: 10,
                            ),
                          
                          ],
                        ),
                      )),
                ),
              ]),
            ),
          ),
        ));
  }
}



// addOrderToOrdersList({
//   String? serviceName,
//   String? clientName,
//   String? clientPhone,
//   String? clientAdress,
//   String? clientDescription,
// }) {}

