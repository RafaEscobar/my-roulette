import 'package:myroulette/models/slice.dart';

abstract class RouletteEvent {
  const RouletteEvent();
}

class AddSliceEvent extends RouletteEvent {
  AddSliceEvent(this.slice);
  final Slice slice;
}

class CleanStateEvent extends RouletteEvent {}

class CleanSliceEvent extends RouletteEvent {}

class DeleteSliceEvent extends RouletteEvent {
  DeleteSliceEvent(this.sliceId);
  final int sliceId;
}

class SpinningChangeEvent extends RouletteEvent {
  SpinningChangeEvent(this.newValue);
  final bool newValue;
}

class CurrentSliceChangeEvent extends RouletteEvent {
  CurrentSliceChangeEvent(this.newSlice);
  final Slice newSlice;
}