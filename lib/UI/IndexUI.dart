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
         SignInWidget( onSignIn:(email,password){
          if(Presenter.signInEmail(pEmail: email,pPassword: password)) {
            print("Ok SignIn");
          }else{
            print("Error SignIn");
          }
         }),
         SignUpWidget( onSignUp:(email,password)async{
           setState(() {
             _progressBarActive = true;
             print("000000000000000000000000000000000000000000000000000000000000000000000000");
           });
           if(await Presenter.signUpEmail(pEmail: email,pPassword: password)) {
             print("Ok SignUp");
           }else{
             print("Error SignUp");
           }
           DialogTool._showMaterialDialog();
           setState(() {
             _progressBarActive = false;
             print("111111111111111111111111111111111111111111111111111111111111111111111111");
           });
         }),
     ],)
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  bool _progressBarActive = false;
}
