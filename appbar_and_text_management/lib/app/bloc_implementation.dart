// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:developer';

import 'package:appbar_and_text_management/bloc/appbar_text_bloc.dart';
import 'package:flutter/material.dart';

class BlocImplemetation extends StatelessWidget {
  BlocImplemetation({Key? key}) : super(key: key);

  final _bloc = AppBarAndTextBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: _bloc.textStream,
        initialData: "",
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.toString()),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  TextField(onChanged: (value) => _bloc.setTextStream(value)),
                  Text("${snapshot.data.toString()}"),
                ],
              ),
            ),
          );
        });
  }
}
