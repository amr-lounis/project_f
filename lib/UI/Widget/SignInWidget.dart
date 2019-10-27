import 'package:flutter/material.dart';
///////////////////////////////////////////////////////////////////////////////
class SignInWidget extends StatefulWidget {
  final Function(String ,String ) onSignIn;
  SignInWidget({this.onSignIn});
  @override
  createState() => _SignInWidgetState();
}
class _SignInWidgetState extends State<SignInWidget> {
  final GlobalKey<FormState> _formKey = new GlobalKey();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Form(
          key: _formKey,
          child: ListView(
              children: <Widget>[
                _buildEmailTextField(),
                _buildPasswordTextField(),
                _buildLoginRaisedButton(),
              ]),
        ),
      ),
    );
  }
  ////////////////////////////////////////////////////////////////////////////////
  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'E-Mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ) {
          return 'Please enter a valid email';
        }else return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration( labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }else return null;
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }
////////////////////////////////////////////////////////////////////////////////
  Widget _buildLoginRaisedButton() {
    return RaisedButton(
      child: Text("Sign in"),
      onPressed: (){
        if(!_formKey.currentState.validate())return;
        _formKey.currentState.save();
        widget.onSignIn(email,password);
      },
    );
  }
////////////////////////////////////////////////////////////////////////////////
}
