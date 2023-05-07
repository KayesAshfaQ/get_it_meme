import 'package:flutter/material.dart';
import 'package:get_it_meme/view/home_page.dart';

import 'locator.dart';

void main() {
  // TODO 4:  call the setup method to initialize the services
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePageView(),
    );
  }
}
