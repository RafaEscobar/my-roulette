import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:myroulette/enums/test_slice.dart';
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
  TestSlice? winner;

  // Rebanadas con color y texto (pueden llevar imagenes)
  late final slices = RouletteGroup.uniform(
    TestSlice.values.length,
    colorBuilder: (index) => TestSlice.values[index].color,
    textBuilder: (index) => TestSlice.values[index].name,
    textStyleBuilder: (index) => TextStyle(fontSize: 22, color: Colors.purple.shade400),
  );

  // Detona el loop de la ruleta cada 6 segundos
  void _spin() async {
    final sliceCount = TestSlice.values.length; // Length estatico de slices
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

    // Protege contra estado desmontado
    if (!mounted) return;

    // Seteamos el slice ganador (puedes ajustar el texto)
    setState(() => winner = TestSlice.values[targetIndex]);

    // Configuración del confeti con opciones (Confetti.launch usa el Overlay)
    Confetti.launch(
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
        colors: [winner!.color, Colors.white, Colors.yellow],
      ),
    );

    _timer = Timer(const Duration(seconds: 3), _spin); // Se detona nuevamente esta misma función 3 segundos despues de haberse ejecutad
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
      child: Stack(
        children: [
          Column(
            spacing: 30,
            children: [
              SizedBox(
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
              Text(winner?. name ?? '', style: TextStyle(fontSize: 22, color: Colors.purple.shade700, fontWeight: FontWeight.w200), ),
            ],
          ),
          Positioned(
            bottom: 82,
            right: 26,
            child: Transform.rotate(
              angle: 0.8,
              child: Icon(Icons.arrow_back_ios_rounded, size: 36, color: Colors.blue,)
            ),
          )
        ],
      )
    );
  }
}
