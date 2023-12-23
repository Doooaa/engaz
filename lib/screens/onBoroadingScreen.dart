// import 'package:flutter/material.dart';
// import '../models/onboardin_data.dart';
// import '../../../core/components/on_boarding_item.dart';
// import 'package:engaz/homeLayout/shopLayout(home).dart';
// import 'package:engaz/core/constants/sharedWidgets.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// PageController _pageController = PageController();

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({Key? key}) : super(key: key);

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   bool isLast = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Color(0xfffafafa),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // CacheHelper.saveData(key: 'onBoarding', value: true)
//               //     .then((value) {
//               //   navigateToAndRemove(context, const LoginScreen());
//               // });
//               navigateToAndRemove(context, HomeLayoutScreen());
//             },
//             child: Text(
//               'SKIP',
//               style: TextStyle(
//                 color: myColor,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (int index) {
//                   if (index == OnBoarding.getOnBoarding.length - 1) {
//                     setState(() {
//                       isLast = true;
//                     });
//                   } else {
//                     setState(() {
//                       isLast = false;
//                     });
//                   }
//                 },
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return onBoardingItem(
//                       context, OnBoarding.getOnBoarding[index]);
//                 },
//                 itemCount: 4,
//               ),
//             ),
//             const SizedBox(height: 40.0),
//             Row(
//               children: [
//                 SmoothPageIndicator(
//                   controller: _pageController,
//                   count: OnBoarding.getOnBoarding.length,
//                   effect: ExpandingDotsEffect(
//                     dotColor: Colors.grey,
//                     activeDotColor: myColor,
//                     dotHeight: 10.0,
//                     dotWidth: 20.0,
//                     spacing: 10.0,
//                     expansionFactor: 4.0,
//                   ),
//                 ),
//                 const Spacer(),
//                 FloatingActionButton(
//                   backgroundColor: myColor,
//                   onPressed: () {
//                     if (isLast == true) {
//                       // CacheHelper.saveData(key: 'onBoarding', value: true)
//                       //     .then((value) {
//                       //   navigateToAndRemove(context, const LoginScreen());
//                       // });
//                     } else {
//                       _pageController.nextPage(
//                         duration: const Duration(
//                           milliseconds: 800,
//                         ),
//                         curve: Curves.fastLinearToSlowEaseIn,
//                       );
//                     }
//                   },
//                   child: const Icon(
//                     Icons.arrow_forward_ios_outlined,
//                     color: Colors.white,
//                     size: 25.0,
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
