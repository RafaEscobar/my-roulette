import 'package:equatable/equatable.dart';
import 'package:myroulette/models/slice.dart';

class RouletteState extends Equatable{
  final List<Slice> slices;
  final List<Slice> dummySlice;

  const RouletteState({
    this.slices = const [],
    this.dummySlice = const []
  });

  RouletteState copyWith({
    List<Slice>? slices,
    List<Slice>? dummySlice
  }) => RouletteState(
    slices: slices ?? this.slices,
    dummySlice: dummySlice ?? this.dummySlice,
  );

  @override
  List<Object?> get props => [slices, dummySlice];
}