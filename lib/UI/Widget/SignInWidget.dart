import 'package:flutter/material.dart';
///////////////////////////////////////////////////////////////////////////////
class SignInWidget extends StatefulWidget {
  final Function onSignIn;
  SignInWidget({this.onSignIn});
  @override
  createState() => _SignInWidgetState();
}
class _SignInWidgetState extends State<SignInWidget> {
  GlobalKey<FormState> _formKey = new GlobalKey();
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
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }
////////////////////////////////////////////////////////////////////////////////
  Widget _buildLoginRaisedButton() {
    return RaisedButton(
      child: Text("Ok"),
      onPressed: (){
        if(!_formKey.currentState.validate())return;
        _formKey.currentState.save();
        widget.onSignIn(email,password);
      },
    );
  }
  String email;
  String password;
}
