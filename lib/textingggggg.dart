import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/char1.png'),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: const Color.fromARGB(108, 255, 193, 7),
                    height: 50,
                    width: 200,
                    child: Text("p1"),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/char5.png'),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Color.fromARGB(182, 145, 139, 137),
                    height: 50,
                    width: 200,
                    child: Center(
                        child: Text(
                      "نجار",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/char5.png'),
                ),
                const Center(
                    child: Text(
                  "نجار",
                  style: TextStyle(fontSize: 20),
                )),
              ],
            )
          ],
        )

        //sliderrrrrrrrrrrrrrrr
      ],
    );
  }
}

/*

 List<Widget> containerList = List.generate(
      5,
      (index) => Container(
        height: 50,
        width: 100,
        color: Colors.blue,
        margin: EdgeInsets.all(8),
        child: Center(
          child: Text('Item $index'),
        ),
      ),
    );

    return ListView(
      // Use ListView to display the list of Container widgets
      children: containerList,
    );
*/
class MyCarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        enlargeCenterPage: true,
        autoPlay: true,
        // aspectRatio: 16/9,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,

        enableInfiniteScroll: true,

        viewportFraction: 0.8,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(
                child: Text(
                  'Item $i',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
/*
      Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            onChanged: (value) {},
                            controller: _Namecontroller,

                            // ignore: non_constant_identifier_names
                            validator: (Value) {
                              String? value = Value;
                              if (value!.trim().isEmpty) {
                                return ' من فضلك اضف الاسم ';
                              } else if (value.trim().length < 6) {
                                return ' من فضلك اضف الاسم باكامل ';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'الاسم بالكامل',
                              enabledBorder: OutlineInputBorderForm(),
                              focusedBorder: OutlineInputBorderForm(),
                              focusedErrorBorder:
                                  ErrorOutlineInputBorderForm(),
                              errorBorder: ErrorOutlineInputBorderForm(),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (Value) {
                              String? value = Value;
                              if (value!.trim().isEmpty) {
                                return 'من فضلك اضف رقم الموبايل ';
                              }
                              return null;
                            },
                            controller: _phonecontroller,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              labelText: 'رقم الموبايل',
                              enabledBorder: OutlineInputBorderForm(),
                              focusedBorder: OutlineInputBorderForm(),
                              focusedErrorBorder:
                                  ErrorOutlineInputBorderForm(),
                              errorBorder: ErrorOutlineInputBorderForm(),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            validator: (Value) {
                              String? value = Value;
                              if (value!.trim().isEmpty) {
                                return 'من فضلك اضف عنوانك ';
                              }
                              return null;
                            },
                            controller: _addresscontroller,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.location_on),
                              labelText: 'العنوان',
                              enabledBorder: OutlineInputBorderForm(),
                              focusedBorder: OutlineInputBorderForm(),
                              focusedErrorBorder:
                                  ErrorOutlineInputBorderForm(),
                              errorBorder: ErrorOutlineInputBorderForm(),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            controller: _descriptioncontroller,
                            validator: (Value) {
                              String? value = Value;
                              if (value!.trim().isEmpty ||
                                  value.trim().length < 10) {
                                return 'من فضلك اضف وصف كامل للمشكلة';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.description),
                              labelText: 'وصف المشكلة (الطلب)',
                              enabledBorder: OutlineInputBorderForm(),
                              focusedBorder: OutlineInputBorderForm(),
                              focusedErrorBorder:
                                  ErrorOutlineInputBorderForm(),
                              errorBorder: ErrorOutlineInputBorderForm(),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: myColor),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    ' ${imageName ?? "الرجاء رفع صورة المشكله"}'),
                                IconButton(
                                    onPressed: _getImage,
                                    icon: Icon(
                                      Icons.cloud_upload,
                                      color: myColor,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: myColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), // Adjust the border radius as needed
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text(' ارسال الطلب'),
                  ),
                )
*/