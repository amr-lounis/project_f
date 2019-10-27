import 'package:flutter/material.dart';

void showMaterialDialog( {BuildContext pContext,String pTitle,String pContent}) {
  Future.delayed(Duration.zero,() {
    showDialog(context: pContext, builder: (context) => AlertDialog(
      title: Text(pTitle),
      content: Column(
        children: <Widget>[
          Text(pContent)
        ],
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('OK')),
      ],
    ));
  });
}
//DialogTool.showMaterialDialog(pContext: context,pTitle: 'Error',pContent: "Error SignUp");
void showSnakeBar1({BuildContext pContext,String pTitle,int pTime = 1}){
  Future.delayed(Duration.zero,() {
    Scaffold.of(pContext).showSnackBar(
      SnackBar(
        content: Text(pTitle),
        duration: Duration(seconds: 1),
      ),
    );
  });
}
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
