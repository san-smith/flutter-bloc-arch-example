import 'package:flutter_bloc_arch/data/api/model/api_user.dart';
import 'package:flutter_bloc_arch/domain/model/user.dart';

class UserMapper {
  static User fromApi(ApiUser apiUser) {
    return User(
      email: apiUser.email,
      firstName: apiUser.firstName,
      id: apiUser.id,
      lastName: apiUser.lastName,
    );
  }
}
