import 'dart:async';
import 'dart:convert' as convert;
import '../Service/HttpService.dart' as HttpService;
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
Future<void> getAll() async{
   String url = "https://flutter-tutorial-13bae.firebaseio.com/user.json";
   _users = [];
   try{
     var s = await HttpService.get(pUrl: url);
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
Future<bool> signIn({String pEmail,String pPassword})async{
  await getAll();
  bool b = false;
  _users.forEach((value){  if(value.email == pEmail && value.password == pPassword){ b=true; } });
  return b;
}
///////////////////////////////////////////////////////////////////////////////
Future<bool>  addUser({UserModel pUser})async {
   String url = "https://flutter-tutorial-13bae.firebaseio.com/user.json";
   await getAll();
   if(isExist(pUser))return false;

  Map<String ,dynamic> u= {
    "id":pUser?.id??"",
    "name":pUser?.name??"",
    "email":pUser?.email??"",
    "phone":pUser?.phone??"",
    "password":pUser?.password??"",
  };
  var s = await HttpService.post(pUrl: url,pBody: convert.jsonEncode(u));
  print(s);
  return (s == null) ? false:true;
}
///////////////////////////////////////////////////////////////////////////////
Future<bool>  updateUser({String pEmail, UserModel pUser})async {
  await getAll();
  UserModel u = getByEmail(pEmail);
  if(u!=null){
    String url = "https://flutter-tutorial-13bae.firebaseio.com/user/${u.id}.json";
    print(url);
    Map<String ,dynamic> userMap= {
      "id":pUser?.id??"",
      "name":pUser?.name??"",
      "email":pUser?.email??"",
      "phone":pUser?.phone??"",
      "password":pUser?.password??"",
    };
    var s = await HttpService.put(pUrl: url,pBody: convert.jsonEncode(userMap));
    print(" **********************************************************   ${s}");
    return true;
  }
  return false;
}
///////////////////////////////////////////////////////////////////////////////
Future<bool>  deleteUser({String pEmail})async {
   await getAll();
   UserModel u = getByEmail(pEmail);
   if(u!=null){
     String url = "https://flutter-tutorial-13bae.firebaseio.com/user/${u.id}.json";
     var s = await HttpService.delete(pUrl: url);
     print(s);
     return true;
   }
  else return false;
}
///////////////////////////////////////////////////////////////////////////////
bool isExist( UserModel pUser){
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
UserModel getByID(String pId) {
  UserModel u;
  _users.forEach((value){  if(value.id == pId){ u=value; } });
  return u;
}
UserModel getByName(String pName) {
  UserModel u;
  _users.forEach((value){  if(value.name == pName){ u=value; } });
  return u;
}
UserModel getByEmail(String pEmail) {
  UserModel u;
  _users.forEach((value){  if(value.email == pEmail){ u=value; } });
  return u;
}///////////////////////////////////////////////////////////////////////////////
UserModel getByPhone(String pPhone) {
  UserModel u;
  _users.forEach((value){  if(value.phone == pPhone){ u=value; } });
  return u;
}
///////////////////////////////////////////////////////////////////////////////