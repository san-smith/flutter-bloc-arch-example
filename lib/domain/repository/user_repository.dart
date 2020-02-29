import 'package:flutter_bloc_arch/domain/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}