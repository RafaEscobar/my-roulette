import 'package:flutter/material.dart';
import 'package:myroulette/bloc/roulette/roulette_state.dart';
import 'package:myroulette/models/slice.dart';
import 'package:roulette/roulette.dart';

class RoulettePlaceholder extends StatelessWidget {
  const RoulettePlaceholder({super.key, required this.controller, required this.callBack, required this.state});
  final RouletteController controller;
  final Function(List<Slice> slices) callBack;
  final RouletteState state;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: .0,
      child: Stack(
        children: [
          SizedBox(
            width: 340,
            child: Roulette(
              group: callBack(state.dummySlice),
              controller: controller,
              style: const RouletteStyle(
                dividerThickness: 0.0,
                dividerColor: Colors.black,
                centerStickSizePercent: 0.05,
                centerStickerColor: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 26,
            child: Transform.rotate(
              angle: 0.8,
              child: Icon(Icons.arrow_back_ios_rounded, size: 46, color: Colors.blue,)
            ),
          )
        ],
      )
    );
  }
}