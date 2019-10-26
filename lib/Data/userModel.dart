class UserModel{
  String name;
  String email;
  String phone;
  String password;
  String role;
  UserModel({this.name,this.email,this.phone,this.password,this.role});
}
List<UserModel> _users = [];
List<UserModel> get_users() {
  return _users;
}
UserModel get_user(int p_id) {
  if(_users.length == 0)_users.add(UserModel(name: "admin",password: "password"));
  return _users[p_id];
}

void addUser(UserModel p_user) {
  _users.add(p_user);
}

void updateUser(int p_id, UserModel p_user) {
  _users[p_id] = p_user;
}

void deleteUser(int p_id) {
  _users.removeAt(p_id);
}
