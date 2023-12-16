import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

 // const colors
Color greyText = const Color.fromARGB(255, 110, 103, 103);
Color myColor = const Color(0xFF009788);
Color mygrey = const Color(0xFF404040);
Color WhiteColor = Colors.white;
Color redColor = const Color(0xFFEF476F);
Color Scaffoldcolor = const Color.fromARGB(146, 245, 235, 235);
Color lightGrey = const Color.fromARGB(255, 234, 230, 230);


  // const navigation
void navigateToScreen(context, ScreenName) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenName,
      ));
}
void navigateToAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false,
  );
}

class mydividor extends StatelessWidget {
  const mydividor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20, top: 5),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}



dynamic showtoast({required context, required String Message, required color}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        Message,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
      )));
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
List<String> ServicesWorkerNames=[
'نقاش',
'نجار',
'محار',
' فني سباكة',
'فني فلاتر',

'تنظيف المنزل',
'تنظف سجاد',
'عامل نظافه',

'فني تركيب كاميرات المراقبة',
'كهربائي' ,
'فني اجهزة الكمبيوتر',
'فني تركيب الرسيفرات',

];