import 'package:flutter/material.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';
import 'package:engaz/screens/homeScreen/homeScreenWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String searchQuery = '';
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("انجز",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                   
                    fontSize: 20,
                  )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_important,
                  color: myColor,
                ))
          ]),
      backgroundColor: Color.fromARGB(56, 245, 235, 235),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixText: '    ',
                    hintText: 'ابحث عن خدمة  ',
                    fillColor: Colors.white,
                    suffixIcon: Icon(
                      Icons.search,
                      color: myColor,
                    )),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
           
          
           // MyCarouselSlider(),
            const SizedBox(height: 10,),
            Text("الخدمات المتاحة",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      //color: myColor
                    )),
            const SizedBox(
              height: 15,
            ),
            searchQuery.trim().isEmpty ? categoryItems() : Container(),
            const SizedBox(
              height: 15,
            ),
            //searchQuery.trim().isNotEmpty
            Column(
              children: CategoryOfAllWokerList(context),
            ),
          ],
        ),
      ),
    );
  }

  Container categoryItems() {
    return Container(
      width: double.infinity,
      height:
          100, // it doesn't work with singlechild if havn't size so we use container
      child: ListView.separated(
          shrinkWrap: false,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 90,
              width: 95,
              decoration: BoxDecoration(
                color: index != 0 ? Colors.white : myColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyCategoriesList[index]['icon'],
                  Text(
                    MyCategoriesList[index]['name'].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: index == 0 ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemCount: MyCategoriesList.length),
    );
  }
}

List<Widget> CategoryOfAllWokerList(BuildContext context) {
  List<List<Map<String, String>>> filteredList = imagesHomeRepairementList
      .map((categoryList) => categoryList
          .where((worker) => worker['name']!.contains(searchQuery.trim()))
          .toList())
      .toList();

  print(filteredList);
  print('quary =${searchQuery.trim()}');
  print('length =${filteredList[1].length}');
  int genreateListWithLength = 0;

  for (int i = 0; i < 3; i++) {
    if (filteredList[i].isNotEmpty) genreateListWithLength++;
  }
  return genreateListWithLength > 0
      ? List.generate(
          genreateListWithLength,
          (indexlist) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  filteredList[indexlist].isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(TitleofCategories[indexlist].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    )),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('للمزيد اسحب ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: myColor,
                                              fontSize: 10,
                                            )),
                                    Icon(
                                      Icons.arrow_back_ios_new,
                                      size: 10,
                                      color: myColor,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      : Text('عفوا لا يوجد خدمة تسمي ${searchQuery.trim()}'),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: double.infinity,
                      height:
                          180, 
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return workerBox(
                                context, indexlist, index, filteredList);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 15,
                              ),
                          itemCount: filteredList[indexlist].length)),
                ],
              ))
      : [Center(child: Text('عفوا لا يوجد خدمة تسمي ${searchQuery.trim()}'))];
}
