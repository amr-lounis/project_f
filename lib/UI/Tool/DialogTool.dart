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