enum Cities {
  London(lat: '52.0733', lon: '-1.0147'),
  SaoPaulo(lat: '-23.5505', lon: '-46.6333'),
  Melbourne(lat: '-37.8136', lon: '144.9631'),
  Nice(lat: '43.7384', lon: '7.4246');

  const Cities({
    required this.lat,
    required this.lon,
  });

  final String lat;
  final String lon;
}
