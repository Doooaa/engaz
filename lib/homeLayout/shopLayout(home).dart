import 'package:iconsax/iconsax.dart';
import 'package:engaz/onlineShop.dart';
import 'package:flutter/material.dart';
import 'package:engaz/orderItemsScreen.dart';
import 'package:engaz/userScreen/userScreen.dart';
import 'package:engaz/homeScreen/homeScreen.dart';


class ShopLayout extends StatefulWidget {
  const ShopLayout({super.key});

  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}

var _currentNavBarIndex = 0;

class _ShopLayoutState extends State<ShopLayout> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     " انجز",
        //     style: TextStyle(
        //       // color: Color.fromARGB(255, 72, 77, 79),
        //       fontWeight: FontWeight.w800,
        //       fontSize: 20,
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           //  navigateToScreen(context,Search_screen());
        //         },
        //         icon: const Icon(Icons.search)),
        //   ],
        // ),

        bottomNavigationBar: NavigationBar(
          height: 75,
          backgroundColor:Colors.white,
          //indicatorColor: Colors.amber, selcted icon
          
          animationDuration: Duration(milliseconds: 1100 ),
          onDestinationSelected: (index) => setState(() {
            _currentNavBarIndex = index;
          }),
          destinations: const [
            NavigationDestination(
                label: "الرئسية",
                icon: Icon(
                  Iconsax.home,
                )),
            NavigationDestination(
                label: "Categories",
                icon: Icon(
                  Iconsax.category,
                )),
          
            NavigationDestination(
                label: "طلباتي",
                icon: Icon(
                  Iconsax.card_receive4,
                )),
                  NavigationDestination(
                label: "المستخدم",
                icon: Icon(
                  Iconsax.user,
                )),
          ],
          selectedIndex: _currentNavBarIndex,
        ),

        body: Screen[_currentNavBarIndex],
      ),
    );
  }
}

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey);
List<Widget> Screen = const [
  MyHomePage(),
  OnlineShopeScreen(),
  UserOrdersItemsScreen(),
  UserScreen(),
];
