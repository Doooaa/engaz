import 'package:flutter/material.dart';

class OrdersProvider with ChangeNotifier {
  int orderNumber = 0;
  List<Map<String, String>> ListOfUserOrder = [
    {
      'serviceName': "خدمه نقاش",
      'clientName': "دعاء جمال",
      'clientPhone': "01126427066",
      'clientAdress': "قنا",
      'selectedAddress': "قنا",
      'clientDescription': "عايز اشطب شقه كامله 4 غرف",
      'date': "11-2-2023 3:2 am",
      'url': 'assets/images/homeRepaire2.jpg',
    },
    {
      'serviceName': "خدمه نقاش",
      'clientName': "دعاء جمال",
      'clientPhone': "01126427066",
      'clientAdress': "قنا",
      'selectedAddress': "قنا",
      'clientDescription': "عايز اشطب شقه كامله 4 غرف",
      'date': "11-2-2023 3:2 am",
      'url': 'assets/images/homeRepaire2.jpg',
    },
    {
      'serviceName': "خدمه نقاش",
      'clientName': "دعاء جمال",
      'selectedAddress': "قنا",
      'clientPhone': "01126427066",
      'clientAdress': "قنا",
      'clientDescription': "عايز اشطب شقه كامله 4 غرف",
      'date': "11-2-2023 3:2 am",
      'url': 'assets/images/homeRepaire2.jpg',
    }
  ];
  addOrderToOrdersList({
    required String serviceName,
    required String clientName,
    required String clientPhone,
    required String clientAdress,
    required String cityAdress,
    required String clientDescription,
    required var date,
    required String url,
  }) {
    ListOfUserOrder.add({
      'serviceName': serviceName,
      'clientName': clientName,
      'clientPhone': clientPhone,
      'clientAdress': clientAdress,
      'clientCityAdress': cityAdress,
      'clientDescription': clientDescription,
      'date': date,
      'url': url,
    });
    orderNumber++;
    notifyListeners();
  }

  deletFromOrdersList(int index) {
    ListOfUserOrder.removeAt(index);
  }

  printlist() {
    print(ListOfUserOrder);
    notifyListeners();
  }
}
