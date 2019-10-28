import 'dart:async' as asyncc;
import 'dart:convert' as convert;
import '../Service/HttpService.dart';
///////////////////////////////////////////////////////////////////////////////
class UserModel{
  String id;
  String name;
  String email;
  String phone;
  String password;
  String role;
  UserModel({this.id,this.name,this.email,this.phone,this.password,this.role});
}
List<UserModel> _users = [];
///////////////////////////////////////////////////////////////////////////////
//String url = "http://192.168.1.199:8080";
String url = "https://flutter-tutorial-13bae.firebaseio.com/user.json";
///////////////////////////////////////////////////////////////////////////////
 getAll() async{
   _users = [];
   try{
     var s = await sendRequest(pUrl: url);
     var allUsersMap = convert.jsonDecode(s??"{}");
     allUsersMap.forEach((pUserId,userMap){
      final u = new UserModel(
        id:  pUserId,
        name : userMap['name'],
        email: userMap['email'],
        phone: userMap['phone'],
        password: userMap['password'],
        role : userMap['role'],
      );
      _users.add(u);
    } );
   }catch(ee){print('************************************************************ Error getAll() ${ee.toString()}');}
  _users.forEach((u){
    print("{\n \t id:${u.id}\n \t name:${u.name}\n \t email:${u.email}\n \t phone:\n${u.phone} \t password:${u.password}\n\}");
  });
}
///////////////////////////////////////////////////////////////////////////////
 getById({String pId})async {
  await getAll();
  UserModel u;
  _users.forEach((value){  if(value.id == pId){ u=value; } });
  return u;
}
///////////////////////////////////////////////////////////////////////////////
signIn({String pEmail,String pPassword})async{
  await getAll();
  bool b = false;
  _users.forEach((value){  if(value.email == pEmail && value.password == pPassword){ b=true; } });
  return b;
}
///////////////////////////////////////////////////////////////////////////////
 addUser({UserModel pUser})async {
   await getAll();
   if(isExist(pUser))return false;

  Map<String ,dynamic> u= {
    "id":pUser?.id??"",
    "name":pUser?.name??"",
    "email":pUser?.email??"",
    "phone":pUser?.phone??"",
    "password":pUser?.password??"",
  };
  var s = await sendRequest(pUrl: url,pBody: convert.jsonEncode(u));
  print(s);
  return (s == null) ? false:true;
}
///////////////////////////////////////////////////////////////////////////////
void updateUser(int pId, UserModel pUser) {
  _users[pId] = pUser;
}
///////////////////////////////////////////////////////////////////////////////
void deleteUser(int pId) {
  _users.removeAt(pId);
}
///////////////////////////////////////////////////////////////////////////////
isExist( UserModel pUser){
  bool boolExist = false;
  _users.forEach((v){
    if(
      v.id    == pUser.id ||
      v.name  == pUser.name  ||
      v.email == pUser.email ||
      v.phone == pUser.phone ||
      v.email == pUser.email
      )boolExist=true;
  });
  return boolExist;
}
///////////////////////////////////////////////////////////////////////////////