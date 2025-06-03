import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class Weatherreq extends WeatherEvent {
  final String uri;
  final String key;
  final String location;

  const Weatherreq({
    required this.uri,
    required this.key,
    required this.location,
  });

  @override
  List<Object?> get props => [uri, key, location];
}
