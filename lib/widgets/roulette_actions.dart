import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_bloc.dart';
import 'package:myroulette/theme/app_theme.dart';
import 'package:myroulette/widgets/ping_text.dart';
import 'package:roulette/roulette.dart';

class RouletteActions extends StatelessWidget {
  const RouletteActions({super.key, required this.controller});
  final RouletteController controller;

  Future<void> _runRoulette({required int sliceCount}) async {
    final random = Random();
    final targetIndex = random.nextInt(sliceCount);
    await controller.rollTo(
      targetIndex,
      offset: 6,
      duration: const Duration(seconds: 6),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    RouletteBloc bloc =  context.watch<RouletteBloc>();
    if (bloc.state.slices.isNotEmpty) {
      return GestureDetector(
        onTap: () => _runRoulette(sliceCount: bloc.state.slices.length),
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
    } else {
      return Text(
        "Agrega una rebanada",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppTheme.primaryPurple,
        ),
      );
    }
  }
}