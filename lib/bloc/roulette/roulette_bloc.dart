import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_event.dart';
import 'package:myroulette/bloc/roulette/roulette_state.dart';
import 'package:myroulette/models/slice.dart';

class RouletteBloc extends Bloc<RouletteEvent, RouletteState>{
  RouletteBloc() : super(RouletteState(
    slices: [],
    dummySlice: [
      Slice(name: "", color: Colors.yellow.withAlpha(90)),
    ]
  )) {
    on<AddSliceEvent>(_onAddSliceEvent);
    on<DeleteSliceEvent>(_onDeleteSliceEvent);
    on<SpinningChangeEvent>(_onSpinningChange);
    on<CurrentSliceChangeEvent>(_onCurrentSliceChangeEvent);
    on<CleanStateEvent>(_onCleanStateEvent);
    on<CleanSliceEvent>(_onCleanSliceEvent);
  }

  void _onAddSliceEvent(AddSliceEvent event, Emitter<RouletteState> emit) {
    emit(state.copyWith(
        slices: List.from(state.slices)..add(event.slice)
    ));
  }

  void _onDeleteSliceEvent(DeleteSliceEvent event, Emitter<RouletteState> emit) {
    emit(state.copyWith(
      slices: List.from(state.slices)..removeAt(event.sliceId)
    ));
  }

  void _onSpinningChange(SpinningChangeEvent event, Emitter<RouletteState> emit) {
    emit(state.copyWith(
      isSpinning: event.newValue
    ));
  }

  void _onCurrentSliceChangeEvent(CurrentSliceChangeEvent event, Emitter<RouletteState> emit) {
    emit(state.copyWith(
      currentSlice: event.newSlice
    ));
  }

  void _onCleanStateEvent(CleanStateEvent event, Emitter<RouletteState> emit) {
    emit(state.copyWith(
      slices: [],
    ));
  }

  void _onCleanSliceEvent(CleanSliceEvent event, Emitter<RouletteState> emit) {
    emit(state.copyWith(
      currentSlice: null
    ));
  }
}