import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screen/home/provider/home_provider.dart';
import 'package:weatherapp/utils/routes.dart';
import 'package:weatherapp/utils/theme_provider.dart';

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider())
    ],
    child: Consumer<HomeProvider>(
      builder: (context, value, child) {
        return  MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode:
          value.themeMode == true ? ThemeMode.light : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: app_routes,
        );
      },

    ),
  ));
}