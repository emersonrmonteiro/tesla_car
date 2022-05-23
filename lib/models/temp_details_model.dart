class TempDetailsModel {
  int temp;
  final int inside;
  final int outside;

  TempDetailsModel({
    required this.temp,
    required this.inside,
    required this.outside,
  });
}

final TempDetailsModel demoTempDetails = TempDetailsModel(
  temp: 25,
  inside: 20,
  outside: 35,
);
