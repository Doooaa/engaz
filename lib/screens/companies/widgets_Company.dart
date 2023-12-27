import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';
import 'package:engaz/screens/companies/form_company.dart';

class GridItem extends StatelessWidget {
  final int index;

  GridItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (
                context,
              ) =>
                      CompanyFormScreen(CompanyImage:   Materiales[index]['image'],CompanyName:   Materiales[index]['name'],)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Color.fromARGB(184, 0, 151, 136),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Materiales[index]['image']!,
                width: 90,
                height: 90,
              ),
              Text(
                ' ${Materiales[index]['name']}',
                style: TextStyle(color: Colors.white,
                fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> Materiales = [
  {
    'image': 'assets/images/company/t.png',
    'name': "توشيبا",
  },
  {
    'image': 'assets/images/company/samsung.png',
    'name': "سامسونح",
  },
  {
    'image': 'assets/images/company/caryazy.png',
    'name': "كريازي",
  },
  {
    'image': 'assets/images/company/lg.png',
    'name': "ال جي",
  },
  {
    'image': 'assets/images/company/unionaire.gif',
    'name': "يونيون ايير",
  },
  {
    'image': 'assets/images/company/tournado.png',
    'name': "تورنيدو",
  },
];
