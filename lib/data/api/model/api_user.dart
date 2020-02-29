class ApiUser {
  final int id;
  final String email;
  final String firstName;
  final String lastName;

  ApiUser.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        firstName = map['first_name'],
        lastName = map['last_name'];
}
