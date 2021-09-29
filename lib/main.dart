import 'package:calculador_de_iimc/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home/home_screen.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: kLightColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: kLightColor,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        //AppBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: kAppBarTitleTS,
          iconTheme: IconThemeData(color: kDarkColor, size: 20),
        ),
        //Icon
        iconTheme: IconThemeData(color: kDarkColor, size: 20),
        fontFamily: "Montserrat",
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: Home(),
    ),
  );
}
