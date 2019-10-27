import '../Data/userModel.dart' as userModel;

Future<bool> signUpEmail({String pEmail,String pPassword})async{
  return await userModel.addUser(pUser: userModel.UserModel(email: pEmail,password: pPassword));
}

Future<bool> signInEmail({String pEmail,String pPassword})async{
  var u = await userModel.getByEmail(pEmail: pEmail);
  if(u==null)return false;
  else if(u.password == pPassword) return true;
  else return false;
}