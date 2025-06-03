import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:wheatherapp/model/weather_data_model.dart';

class Repo {
  Future<WeatherData> fetch(String uri, String key, String location) async {
    final path = '/v1/current.json';
    final queryParameters = {'key': key, 'q': location};

    final url = Uri.https(uri, path, queryParameters);
    debugPrint(url.toString());
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var res = response.body;
      var resBody = jsonDecode(res);
      // var current = resBody["current"];
      // // var location = resBody["location"];
      debugPrint("done resBody: ${resBody.toString()}");
      return WeatherData.fromJson(resBody);
    } else {
      debugPrint("error on fethich9ng");
      return WeatherData();
    }
  }
}
