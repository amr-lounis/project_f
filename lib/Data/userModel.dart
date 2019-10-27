class UserModel{
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
UserModel getByEmail({String pEmail}) {
  if(_users.length == 0)addUser(pUser: UserModel(email: "admin",password: "admin"));
  var u;
  _users.forEach((v){
    if(v.email == pEmail){
      u=v;
      print("${v.email} ${v.password}");
    }
  }
  );
  return u;
}

bool addUser({UserModel pUser}) {
  bool canAdd = true;
  _users.forEach((v){ if(v.email==pUser.email)canAdd=false; });
  if(canAdd == true) {
    _users.add(pUser);
    return true;
  }else{
    return false;
  }
}

void updateUser(int p_id, UserModel p_user) {
  _users[p_id] = p_user;
}

void deleteUser(int p_id) {
  _users.removeAt(p_id);
}
