import 'package:flutter/material.dart';

class OnlineShopeScreen extends StatefulWidget {
  const OnlineShopeScreen({super.key});

  @override
  State<OnlineShopeScreen> createState() => _OnlineShopeScreenState();
}

class _OnlineShopeScreenState extends State<OnlineShopeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:     Stack(
    children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          color: Colors.blue[500],
          child: Align(
              alignment: Alignment(-1.2, 4.0),
              child: Container(
                //margin: EdgeInsets.all(20),
                width: 400,
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://patientcaremedical.com/wp-content/uploads/2018/04/male-catheters.jpg'),
                  ),
                ),
              )))
    ],
  ),
    );
  }
}