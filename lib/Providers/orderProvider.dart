import 'package:flutter/material.dart';
import 'package:engaz/core/components/order_data.dart';
import 'package:engaz/core/components/booking_data.dart';

class OrdersProvider with ChangeNotifier {
  int orderNumber = 0;

  
    addorder(Order NewOdrer) {
     Order.ordersList.add(NewOdrer);
     notifyListeners();
    }
    addBookinorder(BookingOrder NewOdrer) {
     BookingOrder.BookingOrderList.add(NewOdrer);
     notifyListeners();
    }
  

}
