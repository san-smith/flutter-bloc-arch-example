import 'package:flutter_bloc_arch/domain/bloc/user/users_bloc.dart';
import 'package:flutter_bloc_arch/internal/dependencies/user/user_repository_module.dart';

class UserModule {
  static UsersBloc usersBloc() {
    return UsersBloc(
      UserRepositoryModule.userDataRepository(),
    );
  }
}
