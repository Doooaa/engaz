import 'package:xid/xid.dart';
import 'package:flutter/material.dart';
import 'package:engaz/core/components/order_data.dart';
import 'package:engaz/screens/InCard/widget_InCard.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';

class UserOrdersItemsScreen extends StatefulWidget {
  const UserOrdersItemsScreen({super.key});

  @override
  State<UserOrdersItemsScreen> createState() => _UserOrdersItemsScreenState();
}

//var OrderId = Xid();


class _UserOrdersItemsScreenState extends State<UserOrdersItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor,
          title: Text('طلباتي'),
        ),
        backgroundColor: const Color.fromARGB(95, 206, 214, 204),
        body:  ListviewOrders(orderlist: Order.ordersList));
  }
}

class ListviewOrders extends StatelessWidget {
  List<dynamic> orderlist;
   ListviewOrders({
    required this.orderlist,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var orderItem =orderlist[index];
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 280,
              // width: MediaQuery.sizeOf(context).width * .75,
              decoration: BoxDecoration(
                  color: Colors.white, // Color.fromARGB(242, 208, 236, 233),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 174, 172, 172)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    itemInCard(
                      text: 'رقم الطلب : # ${orderItem.orderId}',
                    ),
                    Divider(
                      color: mygrey,
                    ),
                    itemInCard(
                      text: 'اسم الخدمة : ${orderItem.orderName}',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    itemInCard(
                      text: 'معاد الطلب : ${orderItem.orderDate} ',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    itemInCard(
                      text: 'طريقة الدفع : الدفع كاش ',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: mygrey,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialogDetailsOrder(context, index,orderlist);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: myColor,
                          ),
                          child: const Text(
                            'التفاصيل ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: myColor,
                          ),
                          child: const Text(
                            ' حذف ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: orderlist.length);
  }
}
