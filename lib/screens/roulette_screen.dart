import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_state.dart';
import 'package:myroulette/models/slice.dart';

import 'package:roulette/roulette.dart';

class RouletteScreen extends StatelessWidget {
  const RouletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RouletteBloc(),
      child: RouletteView(),
    );
  }
}

class RouletteView extends StatefulWidget {
  const RouletteView({super.key,});


  @override
  State<RouletteView> createState() => _RouletteViewState();
}

class _RouletteViewState extends State<RouletteView> {
  final RouletteController _controller = RouletteController();

  RouletteGroup _buildRouletteGroup(List<Slice> slices) {
    return RouletteGroup.uniform(
      slices.length,
      textBuilder: (index) => slices[index].name,
      colorBuilder: (index) => slices[index].color,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              BlocBuilder<RouletteBloc, RouletteState>(
                builder: (BuildContext context, RouletteState state) {
                  if (state.slices.isEmpty) {
                    return SizedBox(
                      height: 300,
                      child: Roulette(
                        group: _buildRouletteGroup(state.dummySlice),
                        controller: _controller,
                        style: const RouletteStyle(
                          dividerThickness: 0.0,
                          dividerColor: Colors.black,
                          centerStickSizePercent: 0.05,
                          centerStickerColor: Colors.black,
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 300,
                    child: Roulette(
                      group: _buildRouletteGroup(state.slices),
                      controller: _controller
                    ),
                  );
                },
              )
            ],
          ),
        )
      ),
    );
  }
}
