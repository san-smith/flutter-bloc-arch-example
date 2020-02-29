import 'package:flutter_bloc_arch/data/api/api_util.dart';
import 'package:flutter_bloc_arch/domain/model/user.dart';
import 'package:flutter_bloc_arch/domain/repository/user_repository.dart';

class UserDataRepository implements UserRepository {
  final ApiUtil _apiUtil;

  UserDataRepository(this._apiUtil);

  @override
  Future<List<User>> getUsers() async {
    return _apiUtil.getUsers();
  }
}
