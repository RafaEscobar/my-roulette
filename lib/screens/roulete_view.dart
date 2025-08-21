import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_state.dart';
import 'package:myroulette/models/slice.dart';
import 'package:myroulette/widgets/new_slice_form.dart';
import 'package:roulette/roulette.dart';

class RouletteView extends StatefulWidget {
  const RouletteView({super.key,});


  @override
  State<RouletteView> createState() => _RouletteViewState();
}

class _RouletteViewState extends State<RouletteView> {
  final RouletteController _controller = RouletteController();

  TextStyle outlineStyle(double fontSize) => TextStyle(
    fontSize: fontSize,
    color: Colors.purple.shade400,
    fontWeight: FontWeight.bold,
    shadows: const [
      Shadow(offset: Offset(-1, -1), blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(1, -1),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(-1, 1),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(1, 1),   blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(0, -1),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(0, 1),   blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(-1, 0),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(1, 0),   blurRadius: 0, color: Colors.white70),
    ],
  );

  RouletteGroup _buildRouletteGroup(List<Slice> slices) {
    return RouletteGroup.uniform(
      slices.length,
      textBuilder: (index) => slices[index].name,
      colorBuilder: (index) => slices[index].color,
      textStyleBuilder: (index) => outlineStyle(20),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Mi ruleta"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                BlocBuilder<RouletteBloc, RouletteState>(
                  builder: (BuildContext context, RouletteState state) {
                    if (state.slices.isEmpty) {
                      return Transform.rotate(
                        angle: .0,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 340,
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
                    return Stack(
                      children: [
                        Transform.rotate(
                          angle: 3.12,
                          child: SizedBox(
                            height: 340,
                            child: Roulette(
                              group: _buildRouletteGroup(state.slices),
                              controller: _controller
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          right: 36,
                          child: Transform.rotate(
                            angle: 0.8,
                            child: Icon(Icons.arrow_back_ios_rounded, size: 46, color: Colors.blue,)
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ),
      ),
      floatingActionButton: NewSliceForm()
    );
  }
}
