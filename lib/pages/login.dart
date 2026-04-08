import 'package:flutter/material.dart';
// import 'package:bdv_flow/pages/login.dart';



class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BDV', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xFFbb1b47),
      ),

      backgroundColor: Colors.blueGrey[100],
      body: Center(

        child: Column(
          children: [

            SizedBox(height: 250,),
            Image.asset('assets/images/logo.png', width: 200, height: 200,),

          ],

        ),
      ),
    );

  }
}