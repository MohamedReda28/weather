import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherdata;
  String? city;
  set weatherdata(WeatherModel? weather){
    _weatherdata=weather;
    notifyListeners();
  }
  WeatherModel? get weatherdata=>_weatherdata;
}