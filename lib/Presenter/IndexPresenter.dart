import '../Data/userModel.dart' as userModel;

bool signUpEmail({String p_email,String p_password}){
  userModel.addUser(userModel.UserModel(email: p_email,password: p_password));
  print("email: ${p_email} => password: ${p_password}");
  return true;
}

bool signInEmail(String p_email,String p_password){

}