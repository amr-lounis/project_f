import 'dart:async';
import 'package:flutter/material.dart';
import 'Widget/SignInWidget.dart';
import 'Widget/SignUpWidget.dart';
import 'Widget/SnakeBarShow.dart' as SnakeBarShow;
import '../Presenter/IndexPresenter.dart' as Presenter;
///////////////////////////////////////////////////////////////////////////////
class IndexUI extends StatefulWidget {
  IndexUI({Key key, this.title}) : super(key: key);
  final String title;
  @override
  createState() => _IndexUIState();
}
class _IndexUIState extends State<IndexUI> {
  //////////////////////////////////////////////////////////////////////////////
  @override
  initState() {
    initListener();
    super.initState();
  }
  //////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: SnakeBarShow.scaffoldKey,
      appBar: widgetAppBar(),
      body: widgetBody(),
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  widgetAppBar() {
    return AppBar(
      title: Text("IndexUI"),
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  widgetBody() {
    return _boolProgressBar == true ? Center(child: CircularProgressIndicator()):Center(
     child:ListView(
       children: <Widget>[
         SignInWidget( onSignIn:(email,password){ Presenter.signInEmail(pEmail: email,pPassword: password); }),
         SignUpWidget( onSignUp:(email,password){ Presenter.signUpEmail(pEmail: email,pPassword: password); }),
     ],)
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  void initListener(){
    Presenter.progressBarSC.stream.listen((value){
      setState(() {
        _boolProgressBar = value;
      });
    });

    Presenter.signInEmailSC.stream.listen((value){
      if(value) {
        SnakeBarShow.showSnakeBar(pTitle: "SignIn Ok",pTime: 5);
      }else{
        SnakeBarShow.showSnakeBar(pTitle: "SignIn Error",pTime: 5);
      }
    });

    Presenter.signUpEmailSC.stream.listen((value){
      if(value) {
        SnakeBarShow.showSnakeBar(pTitle: "SignUp Ok",pTime: 5);
      }else{
        SnakeBarShow.showSnakeBar(pTitle: "SignUp Error",pTime: 5);
      }
    });
  }
  //////////////////////////////////////////////////////////////////////////////
  bool _boolProgressBar = false;
  //////////////////////////////////////////////////////////////////////////////
}
