import 'package:flutter/material.dart';
import 'UI/indexUI.dart' as  UI;
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      theme: ThemeData(),
      home: UI.indexUI(),
    );
  }
}
