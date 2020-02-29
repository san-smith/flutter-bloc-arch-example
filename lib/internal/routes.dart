import 'package:flutter/material.dart';
import 'package:flutter_bloc_arch/presentation/home/home_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (BuildContext context) => HomeScreen(),
};