import 'package:flutter/material.dart';

import 'components/customPersistantBottomNavBar.dart';
void main() {
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: customPersistentBottomNavBar(context),
    );
  }
}