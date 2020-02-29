import 'package:flutter/material.dart';
import 'package:flutter_bloc_arch/data/api/service/rest_service.dart';
import 'package:flutter_bloc_arch/domain/model/user.dart';

class ApiUtil {
  final RestService restService;

  ApiUtil({
    @required this.restService,
  });

  Future<List<User>> getUsers() async {
    return await restService.getUsers();
  }
}
