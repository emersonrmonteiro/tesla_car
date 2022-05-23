class TyrePsiModel {
  final double psi;
  final int temp;
  final bool isLowPressure;

  TyrePsiModel({
    required this.psi,
    required this.temp,
    required this.isLowPressure,
  });
}

final List<TyrePsiModel> demoPsiList = [
  TyrePsiModel(psi: 23.6, temp: 56, isLowPressure: true),
  TyrePsiModel(psi: 35.0, temp: 41, isLowPressure: false),
  TyrePsiModel(psi: 34.6, temp: 41, isLowPressure: false),
  TyrePsiModel(psi: 34.8, temp: 42, isLowPressure: false),
];
