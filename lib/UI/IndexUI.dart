import 'package:flutter/material.dart';
import 'Widget/SignInWidget.dart';
import 'Widget/SignUpWidget.dart';
///////////////////////////////////////////////////////////////////////////////
class indexUI extends StatefulWidget {
  indexUI({Key key, this.title}) : super(key: key);
  final String title;
  @override
  createState() => _indexUIState();
}
class _indexUIState extends State<indexUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBar(),
      body: widgetBody(),
    );
  }
  //*************************************************
  widgetAppBar() {
    return AppBar(
      title: Text("IndexUI"),
    );
  }
  //*************************************************
  widgetBody() {
    return Center(
//     child: SignInWidget( onSignIn:(email,password){
//       print("${email}  ${password}");
//     })
    child: SignUpWidget(onSignUp: (email,password){
      print("${email}  ${password}");
    },),
    );
  }
}
