import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:engaz/models/onboardin_data.dart';

Widget onBoardingItem(BuildContext context, OnBoarding data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Lottie.asset(data.image),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        data.title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(data.description,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.grey,
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              )),
    ],
  );
}
