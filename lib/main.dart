import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:engaz/sharedWidgets.dart';
import 'package:engaz/orderService/orderProvider.dart';
import 'package:engaz/homeLayout/shopLayout(home).dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider(
        create: (BuildContext context) {
          return OrdersProvider();
        },
        child: MaterialApp(
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [Locale('ar', 'AE')],
          theme: ThemeData(
              fontFamily: 'RB',
              primarySwatch: Colors.teal,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                //unselectedLabelStyle: TextStyle(color: Colors.amber),
              
                elevation: 5,
                selectedItemColor: myColor,
                showSelectedLabels: true,
                //   unselectedItemColor: Colors.grey,
                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                selectedIconTheme: IconThemeData(color: myColor),
              )),
          debugShowCheckedModeBanner: false,
          home: const ShopLayout(),
        ),
      ),
    );
  }
}
