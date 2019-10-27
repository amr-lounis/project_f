import 'package:flutter/material.dart';

void _showMaterialDialog( {BuildContext pContext,String pTitle,String pContent}) {
  showDialog(
      context: pContext,
      builder: (context) {
        return AlertDialog(
          title: Text(pTitle),
          content: Text(pContent),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')
            ),
          ],
        );
      });
}