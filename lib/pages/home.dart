import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildAppBar(),

          // page view deslizable
          _buildBalanceCard(
          ),

          _buildPageIndicator(),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Accesos Directos",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),

// historico op
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Color(0xFFEFEFEF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: _buildTransactionList(),
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFB1113B),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: ''),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.published_with_changes),
              onPressed: () => Navigator.pushNamed(context, '/transfer'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

// widgets internos
  Widget _buildAppBar() {
    return Container(
      color: const Color(0xFFB1113B),
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.notifications_none, color: Colors.white),
          Text(
            "Inicio",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return SizedBox(
      height: 180,
      child: PageView(
        controller: PageController(viewportFraction: 0.9),
        children: [
          _cardTemplate("Saldo Conta Debito", "750,62 Bs", "Agencia 1234-5"),
          _cardTemplate("Saldo Conta Poupança", "1.200,00 Bs", "Agencia 1234-5"),
        ],
      ),
    );
  }

  Widget _cardTemplate(String titulo, String monto, String info) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFB1113B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const Row(
                children: [
                  Icon(Icons.refresh, color: Colors.white, size: 20),
                  SizedBox(width: 15),
                  Icon(Icons.visibility, color: Colors.white, size: 20),
                  SizedBox(width: 15),
                  Icon(Icons.share, color: Colors.white, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(monto, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(info, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFFB1113B), shape: BoxShape.circle)),
        const SizedBox(width: 5),
        Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
      ],
    );
  }

  Widget _buildTransactionList() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text("Historico de Operaciones", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 15),
        _transactionItem("Quarta-Feira, 04 de Fevereiro", "PIX", "1.200,00 Bs"),
        _transactionItem("", "PIX", "+ 1.800,00 Bs", isPositive: true),
        _transactionItem("", "Transferencia", "200,00 Bs"),
        const SizedBox(height: 10),
        _transactionItem("Terça-Feira, 03 de Fevereiro", "Salario", "+ 4.211,00 Bs", isPositive: true),
        _transactionItem("", "PIX", "25,00 Bs"),
      ],
    );
  }

  Widget _transactionItem(String date, String title, String amount, {bool isPositive = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (date.isNotEmpty) Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(date, style: const TextStyle(color: Colors.black54, fontSize: 13)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, color: Colors.black87)),
            Text(
              amount,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isPositive ? Colors.teal : Colors.black87,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}