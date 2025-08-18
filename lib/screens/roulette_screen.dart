import 'dart:math';

import 'package:flutter/material.dart';

import 'package:roulette/roulette.dart';

class RouletteWidget extends StatelessWidget {
  const RouletteWidget({super.key, required this.group, required this.controller});

  final RouletteGroup group;
  final RouletteController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 260,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Roulette(
          group: group,
          controller: controller,
          style: const RouletteStyle(
            dividerThickness: 0.0,
            dividerColor: Colors.black,
            centerStickSizePercent: 0.05,
            centerStickerColor: Colors.black,
          ),
        ),
      ),
    );
  }
}

class RouletteScreen extends StatefulWidget {
  const RouletteScreen({super.key});

  @override
  State<RouletteScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RouletteScreen> {
  static final _random = Random();

  final _controller = RouletteController();
  bool _clockwise = true;

  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];

  final icons = <IconData>[
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.accessibility,
    Icons.account_balance,
    Icons.account_balance_wallet,
  ];

  late final group = RouletteGroup.uniform(
    colors.length,
    colorBuilder: (index) => colors[index],
    textBuilder: (index) {
      if (index == 0) return 'Hi';
      return '';
    },
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Roulette'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              RouletteWidget(
                group: group,
                controller: _controller,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Clockwise: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Checkbox(
                    value: _clockwise,
                    onChanged: (onChanged) {
                      setState(() {
                        _controller.resetAnimation();
                        _clockwise = !_clockwise;
                      });
                    },
                  ),
                ],
              ),
              FilledButton(
                onPressed: () async {
                  final completed = await _controller.rollTo(
                    3,
                    clockwise: _clockwise,
                    offset: _random.nextDouble(),
                  );

                  if (completed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Animation completed')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Animation cancelled')),
                    );
                  }
                },
                child: const Text('ROLL'),
              ),
              FilledButton(
                onPressed: () {
                  _controller.stop();
                },
                child: const Text('CANCEL'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
