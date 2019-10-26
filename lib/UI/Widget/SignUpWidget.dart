import 'package:flutter/material.dart';
///////////////////////////////////////////////////////////////////////////////
class SignUpWidget extends StatefulWidget {
  final Function onSignUp;
  SignUpWidget({this.onSignUp});
  @override
  createState() => _SignUpWidgetState();
}
class _SignUpWidgetState extends State<SignUpWidget> {
  Map<String, dynamic> _formData = {
    'email': null,
    'password': null
  };
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
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordTextController,
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }
  ////////////////////////////////////////////////////////////////////////////////
  Widget _buildPasswordConfirmTextField() {
    return FadeTransition(
      child: SlideTransition(
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Confirm Password',
              filled: true,
              fillColor: Colors.white),
          obscureText: true,
          validator: (String value) {
            if (_passwordTextController.text != value ) {
              return 'Passwords do not match.';
            }
          },
        ),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////
  Widget _buildLoginRaisedButton() {
    return RaisedButton(
      child: Text("Ok"),
      onPressed: (){
        if(!_formKey.currentState.validate())return;
        _formKey.currentState.save();
        widget.onSignUp(_formData['email'],_formData['password']);
      },
    );
  }
////////////////////////////////////////////////////////////////////////////////
  final TextEditingController _passwordTextController = TextEditingController();
}
