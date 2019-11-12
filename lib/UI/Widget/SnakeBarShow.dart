import 'package:flutter/material.dart';
//////////////////////////////////////////////////////////////////////////////
void showSnakeBar1({BuildContext pContext,String pTitle,int pTime = 1}){
  Scaffold.of(pContext).showSnackBar(
    SnackBar(
      content: Text(pTitle),
      duration: Duration(seconds: 1),
    ),
  );
}
//////////////////////////////////////////////////////////////////////////////
GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
void showSnakeBar({String pTitle,int pTime = 1}){
  var s=new SnackBar(
    //action: new SnackBarAction(label: "hello",onPressed: (){ },),
    backgroundColor: Colors.red,
    content: Text(pTitle),
    duration: Duration(seconds: pTime),
  );
  scaffoldKey.currentState.showSnackBar(s);
}
//////////////////////////////////////////////////////////////////////////////
