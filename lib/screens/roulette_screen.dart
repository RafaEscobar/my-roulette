import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myroulette/bloc/roulette/roulette_bloc.dart';
import 'package:myroulette/screens/roulete_view.dart';

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

