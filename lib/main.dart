import 'package:day2/screen/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:day2/screen/bottomnavigationlayout.dart';
import 'package:day2/screen/login.dart';
import 'package:day2/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:day2/screen/dashboardnew_fragment.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: JsonPage(),
      routes: {
        BottomNavigationLayout.routeName: (ctx) => BottomNavigationLayout(),
        RegisterScreen.routeName: (ctx) => RegisterScreen()
      },
    ));
