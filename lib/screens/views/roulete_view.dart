import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_state.dart';
import 'package:myroulette/models/slice.dart';
import 'package:myroulette/utils/app_text_styles.dart';
import 'package:myroulette/widgets/examples/roulette_placeholder.dart';
import 'package:myroulette/widgets/forms/new_slice_form.dart';
import 'package:myroulette/widgets/slice_list.dart';
import 'package:roulette/roulette.dart';

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
      textStyleBuilder: (index) => AppTextStyles.outlineText(fontSize: 20),
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
                      return RoulettePlaceholder(
                        controller: _controller,
                        callBack: _buildRouletteGroup,
                        state: state
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
      floatingActionButton: Container(
        color: Colors.white,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 10,
          children: [
            if (context.watch<RouletteBloc>().state.slices.isNotEmpty) SliceList(),
            NewSliceForm()
          ],
        ),
      )
    );
  }
}
