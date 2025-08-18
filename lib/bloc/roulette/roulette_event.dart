import 'package:myroulette/models/slice.dart';

abstract class RouletteEvent {
  const RouletteEvent();
}

class AddSliceEvent extends RouletteEvent {
  AddSliceEvent(this.slice);
  final Slice slice;
}

class DeleteSliceEvent extends RouletteEvent {
  DeleteSliceEvent(this.sliceId);
  final int sliceId;
}