import 'package:bdv_flow/pages/login.dart';
import 'package:bdv_flow/pages/home.dart';
import 'package:bdv_flow/pages/transfer.dart';
import 'package:flutter/material.dart';
// import 'login.dart';
// import 'home.dart';

void main() => runApp(const MiAppBDV());

class MiAppBDV extends StatelessWidget {
  const MiAppBDV({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BDV Recreación',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/transfer': (context) => const TransferPage(),
      },
    );
  }
}