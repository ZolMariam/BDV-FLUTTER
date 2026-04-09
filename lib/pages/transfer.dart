import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB1113B),
        title: const Text("Transferencia", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección Origen
            _tituloSeccion("Cuenta a debitar"),
            _cajaBlanca(
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet, color: Color(0xFFB1113B)),
                title: const Text("Corriente - 6547"),
                subtitle: const Text("Saldo disponible: Bs. 750,62"),
              ),
            ),

            const SizedBox(height: 25),

            // Sección Destino
            _tituloSeccion("Datos del beneficiario"),
            _cajaBlanca(
              child: Column(
                children: [
                  _campoTexto("Nombre o Razón Social"),
                  const Divider(height: 1),
                  _campoTexto("Cédula / RIF / Pasaporte"),
                  const Divider(height: 1),
                  _campoTexto("Número de Cuenta (20 dígitos)"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Sección Monto
            _tituloSeccion("Monto a transferir"),
            _cajaBlanca(
              child: _campoTexto("Bs. 0,00", tecladoNumerico: true),
            ),

            const SizedBox(height: 40),

// boton continuar
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Transferencia procesada exitosamente")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB1113B),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Continuar", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tituloSeccion(String texto) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 8),
      child: Text(texto, style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

  Widget _cajaBlanca({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: child,
    );
  }

  Widget _campoTexto(String hint, {bool tecladoNumerico = false}) {
    return TextField(
      keyboardType: tecladoNumerico ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(18),
        border: InputBorder.none,
      ),
    );
  }
}