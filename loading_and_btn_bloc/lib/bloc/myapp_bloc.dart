import 'dart:async';

import 'package:loading_and_btn_bloc/model/myapp_model.dart';

class MyAppBloc {
  final StreamController<MyAppModel> _streamController = StreamController();

  Stream<MyAppModel> get myAppStream => _streamController.stream; // for ouput

  void dispose() {
    _streamController.close();
  }

  MyAppModel _appModel = MyAppModel(); // to store the previous + new state 

  void updateStream({bool? showLoading, bool? enableButton}) {
    _appModel = _appModel.copyWith(showLoading: showLoading, enabledButton: enableButton);
    _streamController.sink.add(_appModel);
  }
}
