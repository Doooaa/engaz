import 'dart:ui';
import 'package:engaz/orderService/orderProvider.dart';
import 'package:flutter/material.dart';
import 'package:engaz/orderItemsScreen.dart';

Color greyText = Color.fromARGB(255, 110, 103, 103);
Color myColor = Color(0xFF009788);
//Color myColor = Colors.teal; // const Color.fromARGB(255, 90, 192, 223);
Color mygrey = const Color(0xFF404040);
Color WhiteColor = Colors.white;
Color redColor = const Color(0xFFEF476F);
Color Scaffoldcolor = const Color.fromARGB(146, 245, 235, 235);
Color lightGrey = Color.fromARGB(255, 234, 230, 230);
// ignore: non_constant_identifier_names
void navigateToScreen(context, ScreenName) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenName,
      ));
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

void showDialogDetailsOrder(BuildContext context, OrdersProvider ordersProvider, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: myColor,
        title: const Text(
          "تفاصيل الطلب",
          style: TextStyle(color: Colors.white),
        ),
        content: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: itemInCard(
                        text: text,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: lightGrey,
                ),
                itemInCard(
                  text: 'اسم الخدمة :  ${ordersProvider.ListOfUserOrder[index]['serviceName']}',
                  color: Colors.white,
                ),
                Divider(
                  color: lightGrey,
                ),
                const SizedBox(
                  height: 5,
                ),
                itemInCard(
                  text: 'رقم التواصل:${ordersProvider.ListOfUserOrder[index]['clientPhone']}',
                  color: Colors.white,
                ),
                Divider(
                  color: lightGrey,
                ),
                const SizedBox(
                  height: 5,
                ),
                itemInCard(
                  text:
                      'تفاصيل المشكلة : ${ordersProvider.ListOfUserOrder[index]['clientDescription']}',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  color: lightGrey,
                ),
                itemInCard(
                  text: 'طريقة الدفع : الدفع كاش ',
                  color: Colors.white,
                ),
                Divider(
                  color: lightGrey,
                ),
                const SizedBox(
                  height: 5,
                ),
                itemInCard(
                  text: 'معاد الطلب : 2 ',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: redColor,
            ),
            child: const Text(
              "الغاء",
              style: TextStyle(),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showModal(BuildContext context) {
  showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => Text("data"));
}

// profileStackNotuse(context) {
//   Stack(
//     children: <Widget>[
//       Container(
//           width: MediaQuery.of(context).size.width,
//           height: 150,
//           color: Colors.blue[500],
//           child: Align(
//               alignment: Alignment(-1.4, 4.0),
//               child: Container(
//                 //margin: EdgeInsets.all(20),
//                 width: 400,
//                 height: 125,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: NetworkImage(
//                         'https://patientcaremedical.com/wp-content/uploads/2018/04/male-catheters.jpg'),
//                   ),
//                 ),
//               )))
//     ],
//   );
// }
dynamic showtoast({required context, required String Message, required color}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        Message,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
      )));
}
