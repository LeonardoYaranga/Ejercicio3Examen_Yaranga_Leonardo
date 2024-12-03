import 'package:flutter/material.dart';
import 'fuel_consume_screen.dart'; // Asegúrate de que la lógica esté implementada en esta clase.

class InsertDataScreen extends StatelessWidget {
  // Declarar controladores
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _gasPriceController = TextEditingController();
  final TextEditingController _spentMoneyController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _minutesController = TextEditingController();

  InsertDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insertar Datos"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Campo para kilómetros recorridos
            TextFormField(
              controller: _kmController,
              decoration: const InputDecoration(
                labelText: 'Kilómetros recorridos',
                icon: Icon(Icons.directions_car),
              ),
              keyboardType: TextInputType.number,
            ),
            // Campo para el precio de la gasolina
            TextFormField(
              controller: _gasPriceController,
              decoration: const InputDecoration(
                labelText: 'Precio de la gasolina (por litro)',
                icon: Icon(Icons.local_gas_station),
              ),
              keyboardType: TextInputType.number,
            ),
            // Campo para el dinero gastado
            TextFormField(
              controller: _spentMoneyController,
              decoration: const InputDecoration(
                labelText: 'Dinero gastado en gasolina',
                icon: Icon(Icons.attach_money),
              ),
              keyboardType: TextInputType.number,
            ),
            // Campo para horas del viaje
            TextFormField(
              controller: _hoursController,
              decoration: const InputDecoration(
                labelText: 'Horas del viaje',
                icon: Icon(Icons.access_time),
              ),
              keyboardType: TextInputType.number,
            ),
            // Campo para minutos del viaje
            TextFormField(
              controller: _minutesController,
              decoration: const InputDecoration(
                labelText: 'Minutos del viaje',
                icon: Icon(Icons.access_time_filled),
              ),
              keyboardType: TextInputType.number,
            ),
            // Botón para enviar los datos
            ElevatedButton(
              onPressed: () {
                // Recoger datos ingresados
                double km = double.tryParse(_kmController.text.trim()) ?? 0;
                double gasPrice =
                    double.tryParse(_gasPriceController.text.trim()) ?? 0;
                double spentMoney =
                    double.tryParse(_spentMoneyController.text.trim()) ?? 0;
                int hours = int.tryParse(_hoursController.text.trim()) ?? 0;
                int minutes = int.tryParse(_minutesController.text.trim()) ?? 0;

                // Validar datos
                if (km > 0 &&
                    gasPrice > 0 &&
                    spentMoney > 0 &&
                    (hours > 0 || minutes > 0)) {
                  // Navegar a la pantalla que realiza el cálculo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalculateFuelConsumeScreen(
                        kilometers: km,
                        gasPrice: gasPrice,
                        spentMoney: spentMoney,
                        hours: hours,
                        minutes: minutes,
                      ),
                    ),
                  );
                } else {
                  // Mostrar mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Por favor ingrese datos válidos"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
