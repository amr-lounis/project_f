import 'dart:async';

import '../Data/userModel.dart' as userModel;

void signInEmail({String pEmail,String pPassword})async{
  progressBarSC.sink.add(true);
  var value = await userModel.signIn(pEmail: pEmail,pPassword: pPassword);
  progressBarSC.sink.add(false);
  signInEmailSC.sink.add(value);
}

void signUpEmail({String pEmail,String pPassword})async{
  progressBarSC.sink.add(true);
  var value=  await userModel.addUser(pUser: userModel.UserModel(email: pEmail,password: pPassword));
  progressBarSC.sink.add(false);
  signUpEmailSC.sink.add(value);
}

StreamController<bool> progressBarSC = StreamController();
StreamController<bool> signInEmailSC = StreamController();
StreamController<bool> signUpEmailSC = StreamController();