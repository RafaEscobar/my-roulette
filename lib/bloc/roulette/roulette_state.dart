import 'package:equatable/equatable.dart';
import 'package:myroulette/models/slice.dart';

class RouletteState extends Equatable{
  final List<Slice> slices;
  final List<Slice> dummySlice;
  final bool isSpinning;
  final Slice? currentSlice;

  const RouletteState({
    this.slices = const [],
    this.dummySlice = const [],
    this.isSpinning = false,
    this.currentSlice
  });

  RouletteState copyWith({
    List<Slice>? slices,
    List<Slice>? dummySlice,
    bool? isSpinning,
    Slice? currentSlice
  }) => RouletteState(
    slices: slices ?? this.slices,
    dummySlice: dummySlice ?? this.dummySlice,
    isSpinning: isSpinning ?? this.isSpinning,
    currentSlice: currentSlice ?? this.currentSlice
  );

  @override
  List<Object?> get props => [slices, dummySlice, isSpinning, currentSlice];
}