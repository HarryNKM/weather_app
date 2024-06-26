import 'package:flutter/material.dart';
import 'package:weatherapp/screen/detail/view/detail_screen.dart';
import 'package:weatherapp/screen/home/view/home_screen.dart';
import 'package:weatherapp/screen/splash/view/splash_screen.dart';
import 'package:weatherapp/utils/shared_pref.dart';

import '../screen/bookmark/bookmark.dart';
import '../screen/nointernet/view/noInterNet_screen.dart';

Map<String,WidgetBuilder>app_routes={
  'home':(context)=>HomeScreen(),
  'detail':(context)=>DetailScreen(),
  'nointernet':(context)=>NointernetScreen(),
  '/':(context)=>SplashScreen(),
  'bookmark':(context)=>BookMark(),
};