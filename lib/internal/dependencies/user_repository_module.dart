import 'package:flutter_bloc_arch/data/repository/user_data_repository.dart';
import 'package:flutter_bloc_arch/internal/dependencies/data/api_module.dart';

class UserRepositoryModule {
  static UserDataRepository _userDataRepository;

  static UserDataRepository userDataRepository() {
    if (_userDataRepository == null) {
      _userDataRepository = UserDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _userDataRepository;
  }
}
