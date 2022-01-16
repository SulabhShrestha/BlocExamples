import 'dart:async';

class FabLogicBloc {
  final StreamController<int> _streamController = StreamController();

  Stream<int> get counterStream => _streamController.stream;

  StreamSink<int> get counterSink => _streamController.sink;
}