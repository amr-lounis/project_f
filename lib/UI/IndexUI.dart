import 'package:flutter/material.dart';
import 'Widget/SignInWidget.dart';
import 'Widget/SignUpWidget.dart';
import '../Presenter/IndexPresenter.dart' as Presenter;
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
     child:ListView(
       children: <Widget>[
         SignInWidget( onSignIn:(email,password){
           print("${email}  ${password}");
         }),
         SignUpWidget( onSignUp:(email,password){
           if(Presenter.signUpEmail(p_email: email,p_password: password)) {
             print("Ok SignUp");
           }
         }),
     ],)
    );
  }
}
