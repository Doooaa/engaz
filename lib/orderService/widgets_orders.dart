import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:engaz/sharedWidgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:engaz/orderService/orderProvider.dart';
import 'package:engaz/orderService/orderServiceScreen.dart';

class sendOrderButton extends StatelessWidget {
  sendOrderButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.widget,
    required TextEditingController Namecontroller,
    required TextEditingController phonecontroller,
    required TextEditingController addresscontroller,
    required TextEditingController descriptioncontroller,
    cityAdress,
    imageName,
  })  : _formKey = formKey,
        _Namecontroller = Namecontroller,
        _phonecontroller = phonecontroller,
        _addresscontroller = addresscontroller,
        _descriptioncontroller = descriptioncontroller,
        _cityAdress = cityAdress,
        _imageName = imageName;

  final GlobalKey<FormState> _formKey;
  final orderServiceScreen widget;
  final TextEditingController _Namecontroller;
  final TextEditingController _phonecontroller;
  final TextEditingController _addresscontroller;
  final TextEditingController _descriptioncontroller;
  var _cityAdress;
  String? _imageName;
  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersProvider>(
      builder: (BuildContext context, ordersProvider, Widget? child) {
        return SizedBox(
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
              print(ordersProvider.ListOfUserOrder);
              String DateNow =
                  DateFormat("dd-MM-yyyy hh:mm aa").format(DateTime.now());
              if (_formKey.currentState!.validate()) {
                if (_imageName == null) {
                  showMissingImgAlarm(context);
                }
                ordersProvider.addOrderToOrdersList(
                  serviceName: widget.WorkerName!,
                  clientName: _Namecontroller.text,
                  clientPhone: _phonecontroller.text,
                  clientAdress: _addresscontroller.text,
                  clientDescription: _descriptioncontroller.text,
                  date: DateNow,
                  url: widget.WorkerIamge!,
                  cityAdress: _cityAdress ?? "_cityAdress",
                );
                showtoast(context: context, Message: 'تم اضافة الطلب بنجاح', color: Colors.green[600],);

              }
            },
            child: Text(' ارسال الطلب'),
          ),
        );
      },
    );
  }
}


showMissingImgAlarm(context) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "خطأ في التسجيل",
    desc: "الرجاء رفع صورة المشكلة",
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        color: Color.fromRGBO(0, 179, 134, 1.0),
        child: const Text(
          "اغلاق",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    
    ],
  ).show();
}

List<String> addresses = [
  "الجيزة",
  "الأسكندرية",
  "الدقهلية",
  "الشرقية",
  "المنوفية",
  "القليوبية",
  "البحيرة",
  "الغربية",
  "بور سعيد",
  "دمياط",
  "الإسماعيلية",
  "السويس",
  "كفر الشيخ",
  "الفيوم",
  "بني سويف",
  "مطروح",
  "شمال سيناء",
  "جنوب سيناء",
  "المنيا",
  "أسيوط",
  "سوهاج",
  "قنا",
  "البحر الأحمر",
  "الأقصر",
  "أسوان",
  
];
