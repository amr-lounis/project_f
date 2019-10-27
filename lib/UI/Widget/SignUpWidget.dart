import 'package:flutter/material.dart';
///////////////////////////////////////////////////////////////////////////////
class SignUpWidget extends StatefulWidget {
  final Function(String ,String ) onSignUp;
  SignUpWidget({this.onSignUp});
  @override
  createState() => _SignUpWidgetState();
}
class _SignUpWidgetState extends State<SignUpWidget> {
  final GlobalKey<FormState> _formKey = new GlobalKey();
  final TextEditingController _passwordTextController = TextEditingController();
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
                _buildPasswordConfirmTextField(),
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
      controller: _passwordTextController,
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
  Widget _buildPasswordConfirmTextField() {
    return TextFormField(
      decoration: InputDecoration( labelText: 'Confirm Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (_passwordTextController.text != value ) {
          return 'Passwords do not match.';
        }else return null;
      },
    );
  }
////////////////////////////////////////////////////////////////////////////////
  Widget _buildLoginRaisedButton() {
    return RaisedButton(
      child: Text("Sign up"),
      onPressed: (){
        if(!_formKey.currentState.validate())return;
        _formKey.currentState.save();
        widget.onSignUp(email,password);
      },
    );
  }
////////////////////////////////////////////////////////////////////////////////
}
