import 'package:flutter/material.dart';
import 'package:loading_and_btn_bloc/model/myapp_model.dart';

import 'bloc/myapp_bloc.dart';

/// Managing loading, and button enabled and disabled state

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyAppBloc _bloc = MyAppBloc();

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: StreamBuilder<MyAppModel>(
              stream: _bloc.myAppStream,
              initialData: MyAppModel(),
              builder: (context, snapshot) {
                return snapshot.data!.showLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                              labelText: "Something",
                              errorText: null,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                _bloc.updateStream(enableButton: true);
                              } else {
                                _bloc.updateStream(enableButton: false);
                              }
                            },
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 18, vertical: 8)),
                              overlayColor: MaterialStateProperty.all(Colors.white24),
                            ),
                            child: Text(
                              "Load",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: snapshot.data!.enabledButton
                                ? () {
                                    log("Clicking");
                                    _bloc.updateStream(showLoading: true);
                                  }
                                : null,
                          ),
                        ],
                      );
              }),
        ),
      ),
    );
  }
}
