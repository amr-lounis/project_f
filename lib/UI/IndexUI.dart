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
          if(Presenter.signInEmail(pEmail: email,pPassword: password)) {
            print("Ok SignIn");
          }else{
            print("Error SignIn");
          }
         }),
         SignUpWidget( onSignUp:(email,password){
           if(Presenter.signUpEmail(pEmail: email,pPassword: password)) {
             print("Ok SignUp");
           }else{
             print("Error SignUp");
           }
         }),
     ],)
    );
  }
}
