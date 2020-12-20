class User {
  String firstName;
  String lastName;
  String email;
  String avatar;

  User({this.firstName,this.lastName, this.email, this.avatar});

  User.fromJson(Map<String, dynamic> json)
      : firstName = json["first_name"],
        lastName = json["last_name"],
        email = json["email"],
        avatar = json["avatar"];
}
