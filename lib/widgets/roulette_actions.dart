import 'package:flutter/material.dart';
import 'package:myroulette/theme/app_theme.dart';
import 'package:myroulette/widgets/ping_text.dart';

class RouletteActions extends StatelessWidget {
  const RouletteActions({super.key, required this.hasSlices});
  final bool hasSlices;

  @override
  Widget build(BuildContext context) {
    if (hasSlices) {
      return GestureDetector(
        onTap: () {        },
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