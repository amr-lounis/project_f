import 'dart:async';
import 'package:flutter/material.dart';
import 'Widget/SignInWidget.dart';
import 'Widget/SignUpWidget.dart';
import 'Tool/MessageShowTool.dart' as MessageShowTool;
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
      key: MessageShowTool.scaffoldKey,
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
    return _progressBarActive == true ? Center(child: CircularProgressIndicator()):Center(
     child:ListView(
       children: <Widget>[
         SignInWidget( onSignIn:(email,password){
           setState(() {
             _progressBarActive = true;
           });
           Presenter.signInEmail(pEmail: email,pPassword: password).then((b){
             if(b) {
               MessageShowTool.showSnakeBar(pTitle: "SignIn Ok",pTime: 5);
             }else{
               MessageShowTool.showSnakeBar(pTitle: "SignIn Error",pTime: 5);
             }
             setState(() {
               _progressBarActive = false;
             });
           });
         }),
         SignUpWidget( onSignUp:(email,password){
           setState(() {
             _progressBarActive = true;
           });
           Presenter.signUpEmail(pEmail: email,pPassword: password).then((b){
             if(b) {
               MessageShowTool.showSnakeBar(pTitle: "SignUp Ok",pTime: 5);
             }else{
               MessageShowTool.showSnakeBar(pTitle: "SignUp Error",pTime: 5);
             }
             setState(() {
               _progressBarActive = false;
             });
           });
         }),
     ],)
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  bool _progressBarActive = false;
}
