class Location {
  final double lat;
  final double lon;

  const Location({
    required this.lon,
    required this.lat,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lon: json['lon'],
        lat: json['lat'],
      );
}
