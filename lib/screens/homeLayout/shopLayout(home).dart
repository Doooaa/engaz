import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:engaz/screens/userScreen/userScreen.dart';
import 'package:engaz/screens/homeScreen/homeScreen.dart';
import 'package:engaz/screens/companies/companies_Screen.dart';
import 'package:engaz/screens/InCard/Orders_items_Screen.dart';
import 'package:engaz/screens/orderBooking/bookingServiceScreen.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

var _currentNavBarIndex = 0;

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 75,
          backgroundColor: Colors.white,
          indicatorColor: Color.fromARGB(145, 77, 170, 150),

          animationDuration: Duration(milliseconds: 1100),
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
                label: ' الشركات',
                icon: Icon(
                  Iconsax.category,
                )),
            NavigationDestination(
                label: "الحجز المسبق",
                icon: Icon(
                  Iconsax.ticket,
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
  Company_Screen(),
  BookingScreen(),
  UserOrdersItemsScreen(),
  UserScreen(),
];
