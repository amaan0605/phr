class Userlogin {
  late String name;
  late String email;
  late String mobile;

  Userlogin({required this.name, required this.email, required this.mobile});

  Map<String, dynamic> toJSON() {
    return {'name': name, 'email': email, 'mobile': mobile};
  }

  Userlogin fromJson(Map<String, dynamic> map) {
    return Userlogin(
        name: map['name'], email: map['email'], mobile: map['mobile']);
  }
}
