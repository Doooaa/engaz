import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:engaz/screens/splash_screen.dart';
import 'package:engaz/Providers/orderProvider.dart';
import 'package:engaz/homeLayout/shopLayout(home).dart';
import 'package:engaz/screens/login&Register/login.dart';
import 'package:engaz/core/constants/sharedWidgets.dart';
import 'package:engaz/screens/login&Register/register.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          routes: {
            '/': (context) => HomeLayoutScreen(),
            'Splash_screen': (context) => Splash_screen(),
            '/register': (context) => Register(),
            '/login': (context) => loginScreen(),
          },
          initialRoute: 'Splash_screen',
        ),
      ),
    );
  }
}
