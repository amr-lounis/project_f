import 'dart:async';

import '../Data/userModel.dart' as userModel;

void signInEmail({String pEmail,String pPassword})async{
  ProgressBarSC.sink.add(true);
  var value = await userModel.signIn(pEmail: pEmail,pPassword: pPassword);
  ProgressBarSC.sink.add(false);
  signInEmailSC.sink.add(value);
}

void signUpEmail({String pEmail,String pPassword})async{
  ProgressBarSC.sink.add(true);
  var value=  await userModel.addUser(pUser: userModel.UserModel(email: pEmail,password: pPassword));
  ProgressBarSC.sink.add(false);
  signUpEmailSC.sink.add(value);
}

StreamController<bool> ProgressBarSC = StreamController();
StreamController<bool> signInEmailSC = StreamController();
StreamController<bool> signUpEmailSC = StreamController();