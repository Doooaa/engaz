import 'package:flutter/material.dart';
import 'package:engaz/core/components/booking_data.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';

void showDialogDetailsOrder(BuildContext context, int index,List orderList ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var orderItem = orderList[index];
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
                        text: " رقم الطلب :#  ${orderItem.orderId} ",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: lightGrey,
                ),
                itemInCard(
                  text: 'اسم الخدمة :  ${orderItem.orderName}',
                  color: Colors.white,
                ),
                Divider(
                  color: lightGrey,
                ),
                const SizedBox(
                  height: 5,
                ),
                itemInCard(
                  text: 'رقم التواصل: ${orderItem.clientPhone}',
                  color: Colors.white,
                ),
                Divider(
                  color: lightGrey,
                ),
                const SizedBox(
                  height: 5,
                ),
                itemInCard(
                  text: 'تفاصيل المشكلة : ${orderItem.orderDescription}',
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
                  text: 'معاد الطلب :  ${orderItem.orderDate} ',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                   Divider(
                  color: lightGrey,
                ),
               (orderItem is BookingOrder )? Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    itemInCard(
                      text: 'تاريخ الحجز :  ${orderItem.BookingDate} ',
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                       Divider(
                  color: lightGrey,
                ),
                    itemInCard(
                      text: 'وقت الحجز :  ${orderItem.BookingTime} ',
                      color: Colors.white,
                    ),
                  ],
                ):Container(),
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

class itemInCard extends StatelessWidget {
  itemInCard({
    required this.text,
    this.color,
    super.key,
  });
  String? text;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "no info",
      textAlign: TextAlign.right,
      style: TextStyle(color: color ?? greyText, fontSize: 16),
    );
  }
}
