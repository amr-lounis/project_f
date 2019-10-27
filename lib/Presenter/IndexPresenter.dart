import '../Data/userModel.dart' as userModel;

bool signUpEmail({String pEmail,String pPassword}){
  return userModel.addUser(pUser: userModel.UserModel(email: pEmail,password: pPassword));
}

bool signInEmail({String pEmail,String pPassword}){
  var u =userModel.getByEmail(pEmail: pEmail);
  if(u==null)return false;
  else if(u.password == pPassword) return true;
  else return false;
}