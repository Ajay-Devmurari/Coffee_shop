import 'package:coffee_shop/const.dart';
import 'package:coffee_shop/model/coffee_shop.dart';
import 'package:coffee_shop/screen/intro_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CoffeeShop(),
    child: DevicePreview(
      builder: (context) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: backGroundColor,
          useMaterial3: true,
        ),
        home: const IntroScreen());
  }
}
