import 'package:flutter/material.dart';
import 'package:myroulette/widgets/roulette_example.dart';

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
                  height: 300,
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
              child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0XFFFDE74C).withAlpha(95),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("Generar un nueva ruleta", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple.shade700),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}