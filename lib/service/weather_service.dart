import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService
{
  String baseUrl='http://api.weatherapi.com';
  String apikay='46d530982a5c4443841114012242502';
  Future<WeatherModel> getweather({required String cityname}) async{
    Uri url = Uri.parse('$baseUrl/v1/forecast.json?key=$apikay&q=$cityname&days=7');
    http.Response response=await http.get(url);
     Map<String,dynamic> data = jsonDecode(response.body);
     WeatherModel weathermodel = WeatherModel.formJason(data);
     return weathermodel;

  }
}