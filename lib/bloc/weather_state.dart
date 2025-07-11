import 'package:equatable/equatable.dart';
import 'package:wheatherapp/model/weather_data_model.dart';

abstract class WeatherState extends Equatable {}

// creating States for ui on different responses

class WeatherInitiate extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  WeatherData? resData;
  WeatherLoaded({required this.resData});
  @override
  // TODO: implement props
  List<Object?> get props => [resData];
}

class WeatherError extends WeatherState {
  String errorMsg;
  WeatherError({required this.errorMsg});
  @override
  // TODO: implement props
  List<Object?> get props =>[errorMsg];
}
