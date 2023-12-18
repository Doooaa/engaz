import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:engaz/Providers/orderProvider.dart';
import 'package:engaz/core/components/booking_data.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';
import 'package:engaz/screens/InCard/Orders_items_Screen.dart';
import 'package:engaz/screens/orderBooking/bookingWidgets.dart';
import 'package:engaz/screens/orderBooking/FormbookingScreen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Scaffoldcolor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            MyCarouselSlider(),
             const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "احجز الان الخدمة اللي محتاجها مع انجز",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      navigateToScreen(context, formBookingScreen());
                    },
                    child: Text(
                      'احجز الان',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: myColor),
                    )),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Row(
              children: [
                const Icon(Icons.format_list_numbered_rtl),
                const SizedBox(
                  width: 5,
                ),
                Text("قائمة الحجز ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 76, 73, 73)
                        )),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Consumer<OrdersProvider>(
              builder: (context, provider, child) {
                return Expanded(
                  child: ListviewOrders(
                    orderlist: BookingOrder.BookingOrderList,
                  ),
                );
              },
            )
            // Expanded(
            //     child: ListviewOrders(
            //   orderlist: BookingOrder.BookingOrderList,
            // ))
          ],
        ),
      ),
    );
  }
}
