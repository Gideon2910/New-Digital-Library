import 'package:flutter_application_1/screens/bookpage.dart';
import 'package:flutter_application_1/screens/liked.dart';
import 'package:flutter_application_1/screens/logout.dart';
import 'package:flutter_application_1/screens/rate_us.dart';
import 'package:flutter_application_1/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/menupage.dart';
import 'package:flutter_application_1/screens/write.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      /*onGenerateRoute: router.generateRoute,
      initialRoute: WelcomeRoute,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: ((context) => Info())),*/
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ItemForMenu currentItem = MenuItems.books;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      angle: 0.0,
      borderRadius: 40,
      showShadow: true,
      backgroundColor: Colors.white54,
      slideWidth: MediaQuery.of(context).size.width * 0.45,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => MenuPage(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        ),
      ),
    );
  }

  getScreen() {
    switch (currentItem) {
      case MenuItems.books:
        return BookPage();
      case MenuItems.liked:
        return Liked();
      case MenuItems.write:
        return Write();
      case MenuItems.rate_us:
        return RateUs();
      case MenuItems.logout:
        return Logout();
    }
  }
}
