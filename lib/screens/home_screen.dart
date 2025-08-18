import 'package:flutter/material.dart';
import 'package:myroulette/screens/roulette_screen.dart';
import 'package:myroulette/widgets/roulette_example.dart';
import 'package:myroulette/widgets/simple_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 10,
              children: [
                SizedBox(
                  height: 340,
                  child: RouletteExample(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    Icon(Icons.check_circle_outline, size: 34, color: Colors.purple.shade700),
                    Text("¡Elige de forma fácil!", style: TextStyle(fontSize: 28, color: Colors.purple.shade700),),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: SimpleButton(
                label: 'Generar un nueva ruleta',
                callBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RouletteScreen(),)
                  );
                },
                btnColor: Color(0XFFFDE74C).withAlpha(95),
                textColor: Colors.purple.shade700,
              )
            )
          ],
        ),
      ),
    );
  }
}