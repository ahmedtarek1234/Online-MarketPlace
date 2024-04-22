import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/utils/observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

