import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheatherapp/bloc/weather_bloc.dart';
import 'package:wheatherapp/bloc/weather_state.dart';
import 'package:wheatherapp/screen/show_weather.dart';
import 'package:wheatherapp/screen/whetherLanding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherBloc(),

        child:Whetherlanding(),
      ),
    );
  }
}
