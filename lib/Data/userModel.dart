import '../Service/HttpService.dart';

class UserModel{
  int id;
  String name;
  String email;
  String phone;
  String password;
  String role;
  UserModel({this.name,this.email,this.phone,this.password,this.role});
}
List<UserModel> _users = [];
List<UserModel> getAll() {
  return _users;
}
UserModel getById({int pId}) {
  if(_users.length == 0)addUser(pUser: UserModel(email: "admin",password: "admin"));
  return _users[pId];
}
 getByEmail({String pEmail}) async {
  await Future.delayed(Duration(seconds: 3), () => print('process getByEmail'));
  if(_users.length == 0)addUser(pUser: UserModel(email: "admin",password: "admin"));
  var u;
  _users.forEach((v){
    if(v.email == pEmail){
      u=v;
      //print("${v.email} ${v.password}");
    }
  }
  );
  return u;
}

 addUser({UserModel pUser}) async{
  //String url = "http://192.168.1.199:8080";
  String url = "https://flutter-tutorial-13bae.firebaseio.com/user.json";
  Map<String ,dynamic> u= {
    "id":"${pUser.id}",
    "name":"${pUser.name}",
    "email":"${pUser.email}",
    "phone":"${pUser.phone}",
    "password":"${pUser.password}",
  };
  await sendRequest(url: url,map: u,onReceive: (r){
    print(r);
    return ;
  }
  );

  bool canAdd = true;
  _users.forEach((v){ if(v.email==pUser.email)canAdd=false; });
  if(canAdd == true) {
    pUser.id = _users.length;
    _users.add(pUser);
    return true;
  }else{
    return false;
  }
}

void updateUser(int pId, UserModel pUser) {
  _users[pId] = pUser;
}

void deleteUser(int pId) {
  _users.removeAt(pId);
}
