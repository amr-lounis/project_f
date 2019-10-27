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
////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext cntxt) {
    return Container(margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(cntxt).requestFocus(FocusNode());
        },
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  _buildPasswordTextField(),
                  _buildPasswordConfirmTextField(),
                  _buildLoginRaisedButton(),
                ]),
          ),
        ),
      )
    );
  }
////////////////////////////////////////////////////////////////////////////////
  Widget _buildEmailTextField() {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(),
            child: TextFormField(
              style: TextStyle(color: Theme .of(context) .accentColor),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder( borderSide: BorderSide( color: Theme.of(context).accentColor, width: 1.0 ) ),
                focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color: Theme.of(context).accentColor, width: 1.0 ) ),
                prefixIcon: const Icon( Icons.perm_identity, color: Colors.blue, ),
                labelText: 'E-Mail',
              ),
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                if (value.isEmpty ) {
                  return 'Invalid email';
                }else return null;
              },
              onSaved: (String value) {
                email = value;
              },
            )
        )
    );
  }
  //////////////////////////////////////////////////////////////////////////////
  Widget _buildPasswordTextField() {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(),
            child: TextFormField(
              controller: _passwordTextController,
              style: TextStyle(color: Theme .of(context) .accentColor),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder( borderSide: BorderSide( color: Theme.of(context).accentColor, width: 1.0 ) ),
                focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color: Theme.of(context).accentColor, width: 1.0 ) ),
                prefixIcon: const Icon( Icons.lock, color: Colors.blue, ),
                labelText: 'Password',
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty ) {
                  return 'Invalid Password';
                }else return null;
              },
              onSaved: (String value) {
                password = value;
              },
            )
        )
    );
  }
////////////////////////////////////////////////////////////////////////////////
  Widget _buildPasswordConfirmTextField() {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(),
            child: TextFormField(
              style: TextStyle(color: Theme .of(context) .accentColor),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder( borderSide: BorderSide( color: Theme.of(context).accentColor, width: 1.0 ) ),
                focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color: Theme.of(context).accentColor, width: 1.0 ) ),
                prefixIcon: const Icon( Icons.lock, color: Colors.blue, ),
                labelText: 'Password Confirm',
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (String value) {
                  if (value.isEmpty || _passwordTextController.text != value ) {
                    return 'Passwords do not match.';
                  }else return null;
                },
              onSaved: (String value) {
                password = value;
              },
            )
        )
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
