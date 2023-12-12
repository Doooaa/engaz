import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:engaz/sharedWidgets.dart';
import 'package:engaz/orderService/orderServiceScreen.dart';

// ignore: non_constant_identifier_names
Widget workerBox(context, indexlist, index, ListofAllCurrenWorkers) {
  return SizedBox(
    height: 180,
    width: 150,
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 170,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                ListofAllCurrenWorkers[indexlist][index]['image'].toString(),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: -10,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft:
                    Radius.circular(30.0), // Adjust the border radius as needed
                bottomLeft: Radius.circular(30.0),
              ),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myColor,
                  ),
                  onPressed: () {
                    navigateToScreen(
                        context,
                        orderServiceScreen(
                          ListofAllCurrenWorkers[indexlist][index]['image']
                              .toString(),
                          ListofAllCurrenWorkers[indexlist][index]['name']
                              .toString(),
                        ));
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('اطلب')),
            )),
        Container(
          width: 150,
          height: 30,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 200, 73),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    15,
                  ),
                  bottomRight: Radius.circular(15))),

          //Color.fromARGB(190, 90, 192, 223),//Color.fromARGB(255, 200, 183, 123), //Color.fromARGB(122, 112, 109, 109),
          child: Center(
            child: Text(
              ListofAllCurrenWorkers[indexlist][index]['name'].toString(),
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 14),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
List<Map<String, dynamic>> MyCategoriesList = [
  {
    'name': 'اصلاح المنزل',
    'icon': const Icon(
      Icons.water_drop,
      color: Colors.white,
      size: 35,
    ),
  },
  {
    'name': 'تنظيف',
    'icon': Icon(
      Icons.cleaning_services,
      color: myColor,
      size: 35,
    ),
  },
  {
    'name': 'كهرباء',
    'icon': Icon(
      Iconsax.electricity,
      size: 35,
      color: myColor,
    ),
  },
  {
    'name': 'الخدمات الميكانيكية',
    'icon': Icon(
      Icons.home_repair_service_rounded,
      color: myColor,
      size: 35,
    ),
  },
];

// ignore: non_constant_identifier_names
List<String> TitleofCategories = [
  "اصلاح المنزل",
  "التنظيف",
  "الكهرباء",
];
List<List<Map<String, String>>> imagesHomeRepairementList = [
  //for home repairement
  [
    {
      'image': 'assets/images/homeRepaire1.jpg',
      'name': 'نقاش' //'painter' //نقاش
    },
    {
      'image': 'assets/images/homeRepaire3.jpg',
      'name': 'نجار' //'carpenter' //نجار
    },
    {
      'image': 'assets/images/homeRepaire2.jpg',
      'name': 'محار', //blurring'//محار
    },
    {
      'image': 'assets/images/homeRepaire4.jpg',
      'name': 'فني سباكة' //'plumber'// سباك
    },
    {
      'image': 'assets/images/homeRepaire5.jpg',
      'name': "فني فلاتر" //'water_purifaction'// فلاتر
    }
  ],
  [
    {'image': 'assets/images/clean1.jpg', 'name': 'تنظيف المنزل'},
    {'image': 'assets/images/clean2.jpg', 'name': 'تنظف سجاد'},
    {'image': 'assets/images/clean3.jpg', 'name': 'عامل نظافه'},
  ],
  [
    {
      'image': 'assets/images/camera1.jpg',
      'name': 'فني تركيب كاميرات المراقبة'
    },
    {'image': 'assets/images/electrcian1.jpg', 'name': 'كهربائي'},
    {'image': 'assets/images/computer.jpg', 'name': 'فني اجهزة الكمبيوتر'},
    {
      'image': 'assets/images/Antenna_Installation.jpg',
      'name': 'فني تركيب الرسيفرات'
    },
  ],
];

