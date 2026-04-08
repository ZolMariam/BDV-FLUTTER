import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaInicial(),
  ));
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: const Color(0xFFB1113B),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                child: const Icon(Icons.notifications_none, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}