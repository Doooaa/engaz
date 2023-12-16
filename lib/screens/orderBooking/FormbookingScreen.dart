
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:engaz/Providers/orderProvider.dart';
import 'package:engaz/core/components/order_data.dart';
import 'package:engaz/core/components/booking_data.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';

class formBookingScreen extends StatefulWidget {
  @override
  State<formBookingScreen> createState() => _formBookingScreenState();
}

class _formBookingScreenState extends State<formBookingScreen> {
  String? _imageName;
  final _picker = ImagePicker();

  Future<void> _getImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageName = pickedImage.name;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);
        _dateController.text = formattedDate.toString();
      });
    }
  }

  Future<void> _showTimePicker(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        String formattedTime = pickedTime.format(context); //output 10:51 PM;
        _timeController.text = formattedTime.toString();
      });
    }
  }

  var _formKey = GlobalKey<FormState>();

  TextEditingController _Namecontroller = TextEditingController();

  TextEditingController _phonecontroller = TextEditingController();

  TextEditingController _addresscontroller = TextEditingController();

  TextEditingController _descriptioncontroller = TextEditingController();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  // TextEditingController _imagecontroller = TextEditingController();
  String? selectedAddress;
  String? selectedService;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrdersProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor,
          title: const Text("احجزالان"),
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
                            // .................phone................
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              // ignore: non_constant_identifier_names
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
                            // .................city................
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
                            // .................address................
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
                            //.............. servicename..............
                            DropdownButtonFormField<String>(
                              value: selectedService,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedService = newValue!;
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
                                labelText: 'نوع الخدمة',
                              ),
                              items: ServicesWorkerNames.map(
                                  (String? _serviceName) {
                                return DropdownMenuItem<String>(
                                  value: _serviceName,
                                  child: Text(_serviceName!),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 18,
                            ),

                            // .................date................
                            TextFormField(
                              controller: _dateController,
                              readOnly: true,
                              onTap: () {
                                _selectDate(context);
                              },
                              decoration: const InputDecoration(
                                labelText: "تاريخ الحجز",
                                hintText: "اضغط لاختار التاريخ ",
                                prefixIcon: Icon(Iconsax.calendar),
                              ),
                            ),
                            // .................time................
                            TextFormField(
                                controller: _timeController,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.timer_pause),
                                    labelText: "وقت الحجز"),
                                readOnly:
                                    true, //set it true, so that user will not able to edit text
                                onTap: () async {
                                  _showTimePicker(context);
                                }),

                            //...............discrption..............
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
                                Expanded(
                                  child: Text(
                                    '    ${_imageName ?? "الرجاء رفع صورة المشكله       "}',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
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
                                  print(Order.ordersList);
                                  String DateNow =
                                      DateFormat("dd-MM-yyyy /d hh:mm ")
                                          .format(DateTime.now());
                                  if (_formKey.currentState!.validate()) {
                                    if (_imageName == null) {
                                      showMissingImgAlarm(context);
                                      print(_imageName);
                                    } else {
                                      provider.addBookinorder(BookingOrder(
                                          orderId: "22",
                                          orderName: selectedService,
                                          orderDescription:
                                              _descriptioncontroller.text,
                                          orderDate: DateNow,
                                          clientName: _Namecontroller.text,
                                          BookingDate: _dateController.text,
                                          BookingTime: _timeController.text,
                                          clientPhone: _phonecontroller.text,
                                          clientCity: selectedAddress,
                                          fullAddress:
                                              _addresscontroller.text));
                                      showtoast(
                                        context: context,
                                        Message: 'تم اضافة الطلب بنجاح',
                                        color: Colors.green[600],
                                      );
                                      Navigator.pop(
                                        context,
                                      );
                                    }
                                  }
                                },
                                child: const Text(' ارسال الطلب'),
                              ),
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
