import 'dart:async';
import 'package:flutter/material.dart';
import 'Widget/SignInWidget.dart';
import 'Widget/SignUpWidget.dart';
import 'Tool/DialogTool.dart' as DialogTool;
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
    return _progressBarActive == true ? Center(child: CircularProgressIndicator()):Center(
     child:ListView(
       children: <Widget>[
         SignInWidget( onSignIn:(email,password)async{
           setState(() {
             _progressBarActive = true;
           });
          if(await Presenter.signInEmail(pEmail: email,pPassword: password)) {
            print("Ok SignIn");
          }else{
            DialogTool.showMaterialDialog(pContext: context,pTitle: 'Error',pContent: "Error SignIn");
          }
           setState(() {
             _progressBarActive = false;
           });
         }),
         SignUpWidget( onSignUp:(email,password)async{
           setState(() {
             _progressBarActive = true;
           });
           if(await Presenter.signUpEmail(pEmail: email,pPassword: password)) {
             print("Ok SignUp");
           }else{
             DialogTool.showMaterialDialog(pContext: context,pTitle: 'Error',pContent: "Error SignUp");
           }
           setState(() {
             _progressBarActive = false;
           });
         }),
     ],)
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  bool _progressBarActive = false;
}
