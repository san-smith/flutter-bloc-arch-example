import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_arch/domain/bloc/user/users_bloc.dart';
import 'package:flutter_bloc_arch/internal/dependencies/user/user_module.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UsersBloc _usersBloc = UserModule.usersBloc();

  @override
  void initState() {
    super.initState();
    _usersBloc.add(UsersGetEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _usersBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пользователи'),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return BlocBuilder<UsersBloc, UsersState>(
      bloc: _usersBloc,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Stack(
            children: <Widget>[
              if (state is UsersLoadingState) _getLoader(),
              if (state is UsersFailedState) _getError(state),
              if (state is UsersSuccessState) _getContent(state),
            ],
          ),
        );
      },
    );
  }

  Widget _getLoader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getError(UsersFailedState state) {
    return Center(
      child: Text('${state.error}'),
    );
  }

  Widget _getContent(UsersSuccessState state) {
    return ListView(
      children: <Widget>[
        ...state.users.map((item) => ListTile(
              title: Text(
                '${item.firstName} ${item.lastName}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${item.email}'),
            )),
      ],
    );
  }
}
