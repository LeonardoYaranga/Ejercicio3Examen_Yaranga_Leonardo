class FuelConsumeCalculator {
  final double kilometers; // Kilómetros recorridos
  final double gasPrice; // Precio por litro de gasolina
  final double spentMoney; // Dinero gastado en gasolina
  final int hours; // Horas del viaje
  final int minutes; // Minutos del viaje

  FuelConsumeCalculator({
    required this.kilometers,
    required this.gasPrice,
    required this.spentMoney,
    required this.hours,
    required this.minutes,
  });

  // Calcular los litros consumidos en el viaje
  double calculateLitersUsed() {
    return spentMoney / gasPrice;
  }

  // Calcular el consumo de gasolina por cada kilómetro (litros/km)
  double calculateLitersPerKm() {
    final litersUsed = calculateLitersUsed();
    return litersUsed / kilometers;
  }

  // Calcular el consumo de gasolina cada 100 kilómetros (litros/100km)
  double calculateLitersPer100Km() {
    return calculateLitersPerKm() * 100;
  }

  // Calcular el costo de gasolina por cada kilómetro (dinero/km)
  double calculateCostPerKm() {
    return calculateLitersPerKm() * gasPrice;
  }

  // Calcular el costo de gasolina cada 100 kilómetros (dinero/100km)
  double calculateCostPer100Km() {
    return calculateCostPerKm() * 100;
  }

  // Calcular la velocidad media en km/h
  double calculateSpeedKmH() {
    final totalHours = hours + (minutes / 60);
    return kilometers / totalHours;
  }

  // Calcular la velocidad media en m/s
  double calculateSpeedMS() {
    final totalSeconds = (hours * 3600) + (minutes * 60);
    return (kilometers * 1000) / totalSeconds;
  }
}
