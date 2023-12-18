import 'package:flutter/material.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';
import 'package:engaz/screens/companies/widgets_Company.dart';
class Company_Screen extends StatelessWidget {
  const Company_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            const SizedBox(
              height: 20,
            ),
             Padding(
              padding:const EdgeInsets.only(left: 20),
              child: Text(
                "اطلب بسرعة",
                style: TextStyle(
                    color: myColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text(
                " مع انجز كل خدمات الشركات الكربائية بدل ما تضيع وقتك علي الخط الساخن ",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(child: ,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 8.0, // Spacing between columns
                  mainAxisSpacing: 8.0, // Spacing between rows
                ),
                itemCount: 6, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  return GridItem(index: index);
                },
              ),

      
            ),
          ],
        ),
      ),
    );
  }


  }
