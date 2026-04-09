import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
// banner fondo
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/banner-bdv.png",
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),

// principal
          Column(
            children: [
              Container(
                height: 100,
                color: const Color(0xFFB1113B),
                padding: const EdgeInsets.only(top: 40, left: 16),
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.notifications_none, color: Colors.white),
              ),

              const SizedBox(height: 40),

              Image.asset(
                "assets/images/logo.png",
                height: 180,
                // width: 150,
                fit: BoxFit.contain,
                // fit: BoxFit.fitWidth,
              ),

              const Spacer(),

// boton login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB1113B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Fazer login",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

// abrir conta
              const Text(
                "Abrir uma conta no BDV",
                style: TextStyle(
                  color: Color(0xFFB1113B),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 50),

// botoes atalhos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _QuickButton(icon: Icons.mobile_friendly, label: "Fast Pix"),
                  _QuickButton(icon: Icons.payment, label: "PayPal"),
                  _QuickButton(icon: Icons.account_balance_wallet, label: "Exibir saldos"),
                ],
              ),

              const SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFB1113B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }
}