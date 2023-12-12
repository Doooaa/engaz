import 'package:xid/xid.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:engaz/sharedWidgets.dart';
import 'package:engaz/orderService/orderProvider.dart';

class UserOrdersItemsScreen extends StatefulWidget {
  const UserOrdersItemsScreen({super.key});

  @override
  State<UserOrdersItemsScreen> createState() => _UserOrdersItemsScreenState();
}

var x = 99;
 //var OrderId = Xid();
//  String OrderId = Uuid().v4();
String text = 'رقم الطلب : # ${x}';

class _UserOrdersItemsScreenState extends State<UserOrdersItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor,
          title: Text('طلباتي'),
        ),
        backgroundColor: const Color.fromARGB(95, 206, 214, 204),
        body: const ListviewOrders());
  }
}

class ListviewOrders extends StatelessWidget {
  const ListviewOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersProvider>(builder: (context, ordersProvider, _) {
      return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 280,
                // width: MediaQuery.sizeOf(context).width * .75,
                decoration: BoxDecoration(
                    color:Colors.white,// Color.fromARGB(242, 208, 236, 233),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 174, 172, 172)
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
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
                        text: 'رقم الطلب : # ${x}',
                      ),
                      Divider(
                        color: mygrey,
                      ),
                      itemInCard(
                        text: 'اسم الخدمة : ${ordersProvider.ListOfUserOrder[index]['serviceName']}',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      itemInCard(
                        text: 'معاد الطلب : ${ordersProvider.ListOfUserOrder[index]['date']} ',
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
                      // itemInCard(
                      //   text: 'معاد الطلب : 2 ',
                      // ),
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
                           showDialogDetailsOrder(context,ordersProvider,index);
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
          itemCount: ordersProvider.ListOfUserOrder.length);
    });
  }
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
      text??"no info",
      textAlign: TextAlign.right,
      style: TextStyle(color:color?? greyText, fontSize: 16),
    );
  }
}
/*

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Business Card'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: BusinessCard(),
        ),
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   radius: 50,
          //   backgroundImage: AssetImage('assets/profile_picture.jpg'),
          // ),
          SizedBox(height: 16),
          Text(
            'Doaa Gamal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Job Title',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          ContactInfo(
            icon: Icons.phone,
            info: '+020112642704',
          ),
          ContactInfo(
            icon: Icons.email,
            info: 'doaaGamal134.email@example.com',
          ),
          ContactInfo(
            icon: Icons.location_on,
            info: 'Qena',
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String info;

  ContactInfo({required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(width: 8),
          Text(info),
        ],
      ),
    );
  }
}
 */