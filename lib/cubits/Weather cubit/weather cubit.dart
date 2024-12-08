import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/Weather%20cubit/weather%20state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState>
{
  WeatherCubit(this.weatherService) : super(InatialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? city;
  void GetWeather (String cityname)async
  {
    city=cityname;
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getweather(cityname: cityname);
      emit(WeatherSuccess());
    } on Exception catch (e) {
     emit(WeatherFailure());
    }
  }

}