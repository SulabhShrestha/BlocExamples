import 'dart:async';

class AppBarAndTextBloc {
  final StreamController<String> _streamController = StreamController();

  Stream<String> get textStream => _streamController.stream;

  void setTextStream(String newText) => _streamController.sink.add(newText);
}
