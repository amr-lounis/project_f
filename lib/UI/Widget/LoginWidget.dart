import 'package:flutter/material.dart';
///////////////////////////////////////////////////////////////////////////////
class LoginWidget extends StatefulWidget {
  final Function onLogine;
  const LoginWidget({Key key, this.onLogine}): super(key: key);
  @override
  createState() => _LoginWidgetState();
}
class _LoginWidgetState extends State<LoginWidget> {
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
                RaisedButton(
                  child: Text("Ok"),
                  onPressed: (){
                    if(!_formKey.currentState.validate())return;
                    _formKey.currentState.save();
                    widget.onLogine(_formData['email'],_formData['password']);
                  },
                )
              ]),
        ),
      ),
    );
  }
  //
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
        _formData['password'] = value;
      },
    );
  }
  //
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
//
}
