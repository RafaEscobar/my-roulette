import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:myroulette/bloc/roulette/roulette_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_event.dart';
import 'package:myroulette/theme/app_theme.dart';
import 'package:myroulette/widgets/ping_text.dart';
import 'package:roulette/roulette.dart';

class RouletteActions extends StatelessWidget {
  const RouletteActions({super.key, required this.controller});
  final RouletteController controller;

  void _throwConfetti(BuildContext context, Color color) => Confetti.launch(
      context,
      options: ConfettiOptions(
        particleCount: 120,
        spread: 70,
        y: 0.6,
        startVelocity: 50,
        decay: 0.95,
        gravity: 0.6,
        ticks: 200,
        x: 0.5,
        colors: [color, Colors.white, Colors.yellow],
      ),
    );

  Future<void> _runRoulette({required BuildContext context, required int sliceCount, required RouletteBloc bloc}) async {
    bloc.add(SpinningChangeEvent(true));
    final targetIndex = Random().nextInt(sliceCount);
    bloc.add(CurrentSliceChangeEvent(bloc.state.slices[targetIndex]));
    await controller.rollTo(
      targetIndex,
      offset: 6,
      duration: const Duration(seconds: 6),
      curve: Curves.easeOut,
    );
    if (!context.mounted) return;
    _throwConfetti(context, bloc.state.currentSlice!.color);
    bloc.add(SpinningChangeEvent(false));
  }

  @override
  Widget build(BuildContext context) {
    RouletteBloc bloc = context.watch<RouletteBloc>();
    if (bloc.state.slices.isNotEmpty && bloc.state.currentSlice==null) {
      return GestureDetector(
        onTap: () => _runRoulette(context: context, sliceCount: bloc.state.slices.length, bloc: bloc),
        child: PingText(
          text: '¡Pulsa aquí para girar!',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryPurple,
          ),
          duration: const Duration(milliseconds: 1400),
          beginScale: 1.0,
          endScale: 1.3,
          pulses: 1,
        ),
      );
    } else if(bloc.state.slices.isEmpty && !bloc.state.isSpinning) {
      return Text(
        "Agrega una rebanada",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppTheme.primaryPurple,
        ),
      );
    } else if(!bloc.state.isSpinning && bloc.state.currentSlice!=null) {
      return Column(
        children: [
          Text(
            bloc.state.currentSlice!.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryPurple,
            ),
          ),
          
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}