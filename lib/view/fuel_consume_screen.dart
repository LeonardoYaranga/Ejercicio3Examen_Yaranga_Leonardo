import 'package:flutter/material.dart';
import '../controller/fuel_consume_calculator.dart'; // Clase donde está la lógica de cálculo.

class CalculateFuelConsumeScreen extends StatefulWidget {
  final double kilometers; // Kilómetros recorridos.
  final double gasPrice; // Precio de la gasolina por litro.
  final double spentMoney; // Dinero gastado en gasolina.
  final int hours; // Horas del viaje.
  final int minutes; // Minutos del viaje.

  const CalculateFuelConsumeScreen({
    super.key,
    required this.kilometers,
    required this.gasPrice,
    required this.spentMoney,
    required this.hours,
    required this.minutes,
  });

  @override
  State<CalculateFuelConsumeScreen> createState() =>
      _CalculateFuelConsumeScreenState();
}

class _CalculateFuelConsumeScreenState
    extends State<CalculateFuelConsumeScreen> {
  late double litersUsed; // Litros consumidos.
  late double fuelConsumptionPerKm; // Consumo por kilómetro.
  late double fuelConsumptionPer100Km; // Consumo por 100 kilómetros.
  late double costPerKm; // Costo por kilómetro.
  late double costPer100Km; // Costo por 100 kilómetros.
  late double speedKmH; // Velocidad en km/h.
  late double speedMS; // Velocidad en m/s.

  @override
  void initState() {
    super.initState();

    // Usar la clase `FuelConsumeCalculator` para realizar los cálculos.
    final calculator = FuelConsumeCalculator(
      kilometers: widget.kilometers,
      gasPrice: widget.gasPrice,
      spentMoney: widget.spentMoney,
      hours: widget.hours,
      minutes: widget.minutes,
    );

    // Realizar cálculos.
    litersUsed = calculator.calculateLitersUsed();
    fuelConsumptionPerKm = calculator.calculateLitersPerKm();
    fuelConsumptionPer100Km = calculator.calculateLitersPer100Km();
    costPerKm = calculator.calculateCostPerKm();
    costPer100Km = calculator.calculateCostPer100Km();
    speedKmH = calculator.calculateSpeedKmH();
    speedMS = calculator.calculateSpeedMS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de Gasolina'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kilómetros recorridos: ${widget.kilometers.toStringAsFixed(2)} km',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Precio de la gasolina: \$${widget.gasPrice.toStringAsFixed(2)} por litro',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Dinero gastado: \$${widget.spentMoney.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Litros consumidos: ${litersUsed.toStringAsFixed(2)} litros',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Consumo por cada kilómetro: ${fuelConsumptionPerKm.toStringAsFixed(3)} litros',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Consumo por cada 100 kilómetros: ${fuelConsumptionPer100Km.toStringAsFixed(3)} litros',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Costo por cada kilómetro: \$${costPerKm.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Costo por cada 100 kilómetros: \$${costPer100Km.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Velocidad media: ${speedKmH.toStringAsFixed(2)} km/h',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Velocidad media: ${speedMS.toStringAsFixed(2)} m/s',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
