import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel{
  late final String date;
   final double avetemp;
   final double maxtemp;
   final double mintemp;
   final String state;
  WeatherModel(
      {required this.date,required this.avetemp,required this.maxtemp,
        required this.mintemp,required this.state});
 factory WeatherModel.formJason(dynamic data)
  {

   return WeatherModel(
       date: data['location']['localtime'] ,
       avetemp: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
       maxtemp: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
       mintemp: data['forecast']['forecastday'][0]['day']['mintemp_c'],
       state:  data['forecast']['forecastday'][0]['day']['condition']['text']);
  }
  @override
  String toString() {

    return 'date = $date avetemp = $avetemp maxtemp =$maxtemp mintemp =$mintemp state =$state';
  }
  String? getimage() {

    if (state == 'Thunderstrom'||state == 'Thunder') {
       return 'assets/images/thunderstorm.png';
    }
    else if (state == 'Snow'||state == 'Hail'||state == 'Sleet') {
      return 'assets/images/snow.png';
    }
    else if (state == 'Light Rain'||state == 'Heavy Rain'||state == 'Showers') {
      return  'assets/images/rainy.png';
    }
    else if (state == 'Heavy Cloudy') {
      return 'assets/images/cloudy.png';
    }
    else if (state == 'Clear'||state == 'Light Cloud') {
      return 'assets/images/clear.png';
    }else{
      return 'assets/images/clear.png';
    }

  }
  MaterialColor getcolor(){
    if (state == 'Thunderstrom'||state == 'Thunder') {
      return Colors.deepPurple;
    }
    else if (state == 'Snow'||state == 'Hail'||state == 'Sleet') {
      return Colors.brown;
    }
    else if (state == 'Light Rain'||state == 'Heavy Rain'||state == 'Showers'||state == 'Sunny') {
      return  Colors.yellow;
    }
    else if (state == 'Heavy Cloudy') {
      return Colors.green;
    }
    else if (state == 'Clear'||state == 'Light Cloud') {
      return Colors.teal;
    }else{
      return Colors.teal;
    }
  }
}