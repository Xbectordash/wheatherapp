import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheatherapp/bloc/weather_event.dart';
import 'package:wheatherapp/bloc/weather_state.dart';
import 'package:wheatherapp/model/responseModel.dart';
import 'package:wheatherapp/repo/repo.dart';
import 'package:wheatherapp/screen/whetherLanding.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // Creating bloc to control data and state
  WeatherBloc() : super(WeatherInitiate()) {
    on<Weatherreq>((event, emit) async {
      //  Calling and loading WeatherLoading() State
      emit(WeatherLoading());
      try {
        // Fethcing data from repo
        ResponseData resData = await Repo().fetch(
          event.uri,
          event.key,
          event.location,
        );
        debugPrint("data is in bloc: ${resData.toString()}");
        emit(WeatherLoaded(resData: resData));
      } catch (e) {
        // checking errors
        debugPrint("this is in bloc ctach : ${e.toString()}");
        emit(WeatherError(errorMsg: e.toString()));
      }
    });
  }
}
