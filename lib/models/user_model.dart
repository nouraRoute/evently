class UserModel {
  String email;
  String name;
  String uid;
  UserModel({required this.email, required this.name, required this.uid});
  toJson() {
    return {"email": email, "name": name, "uid": uid};
  }

  static fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'], name: json['name'], uid: json['uid']);
  }
}
