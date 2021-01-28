import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_math/home_page.dart';
import 'package:t_math/unit_info_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Math',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFFD32F2F),
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
                headline4: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                headline3: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
        ),
      ),
      initialRoute: "/",
      onGenerateRoute: (RouteSettings routeSetting) => MaterialPageRoute(
        builder: (context) => {
          "/": (_) => HomePage(),
          HomePage.routeName: (_) => HomePage(),
          UnitInfoPage.routeName: (_) {
            return UnitInfoPage(arguments: routeSetting.arguments);
          },
        }[routeSetting.name](context),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
