import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class Weatherreq extends WeatherEvent {
  // Event are the requests -----> making data fecthing request
  // Use equitable for better Management 
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
