import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_arch/domain/model/user.dart';
import 'package:flutter_bloc_arch/domain/repository/user_repository.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository _userRepository;

  UsersBloc(this._userRepository);

  @override
  get initialState => UsersInitialState();

  @override
  Stream<UsersState> mapEventToState(event) async* {
    if (event is UsersGetEvent) {
      yield* _getUsersToState();
    }
  }

  Stream<UsersState> _getUsersToState() async* {
    yield UsersLoadingState();
    try {
      var users = await _userRepository.getUsers();
      yield UsersSuccessState(users);
    } catch (error) {
      yield UsersFailedState(error);
    }
  }
}

abstract class UsersEvent {}

class UsersGetEvent extends UsersEvent {}

abstract class UsersState extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersSuccessState extends UsersState {
  final List<User> users;

  UsersSuccessState(this.users);

  @override
  List<Object> get props => [users];
}

class UsersFailedState extends UsersState {
  final Exception error;

  UsersFailedState(this.error);
}
