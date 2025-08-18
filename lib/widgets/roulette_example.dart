import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:roulette/roulette.dart';

class RouletteExample extends StatefulWidget {
  const RouletteExample({super.key});

  @override
  State<RouletteExample> createState() => _RouletteExampleState();
}

class _RouletteExampleState extends State<RouletteExample> {
  final _controller = RouletteController(); // Controlador de la ruleta
  final _random = Random(); // Instancia Random para trabajar con la aleatoreidad del slice
  Timer? _timer; // Intanacia para trabajar los lapsos de tiempo

  // Gama de colores usada en los slice (debe coincidir con la cantidad de slices)
  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];

  // Rebanadas con color y texto (pueden llevar imagenes)
  late final slices = RouletteGroup.uniform(
    colors.length,
    colorBuilder: (index) => colors[index],
    textBuilder: (index) {
      if (index == 0) return 'Cafe';
      if (index == 1) return 'Té';
      if (index == 2) return 'Malteada';
      if (index == 3) return 'Licuado';
      return '';
    },
    textStyleBuilder: (index) => TextStyle(fontSize: 22, color: Colors.purple.shade400),
  );

  // Detona el loop de la ruleta cada 6 segundos
  void _spin() async {
    const sliceCount = 4; // Length estatico de slices
    final targetIndex = _random.nextInt(sliceCount); // Genera un número aleatorio entero entre 0 y 4

    // Configuración de la ruleta basada en el controlador:
    /*
    * targetIndex: la posición ganadora que seleccionará la ruleta
    * offset: vueltas lentas que dará la ruleta antes de detenerse
    * duration: tiempo hasta quedar en la posición ganadora
    * curve: tipo de animación
    */
    await _controller.rollTo(
      targetIndex,
      offset: 6,
      duration: const Duration(seconds: 6),
      curve: Curves.easeOut,
    );

    // Loop: Se detona nuevamente esta misma función 3 segundos despues de haberse ejecutado
    _timer = Timer(const Duration(seconds: 3), _spin);
  }

  // Inicio del giro infinito de la ruleta
  void _startLoop() {
    Future.delayed(const Duration(seconds: 1), _spin);
  }

  @override
  void initState() {
    super.initState();
    _startLoop();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 260,
        height: 260,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Roulette(
            group: slices,
            controller: _controller,
            style: const RouletteStyle(
              dividerThickness: 0.0,
              dividerColor: Colors.black,
              centerStickSizePercent: 0.05,
              centerStickerColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
