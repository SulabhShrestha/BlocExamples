// ignore_for_file: use_key_in_widget_constructors

import 'package:appbar_and_text_management/app/bloc_implementation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocImplemetation(),
    );
  }
}

