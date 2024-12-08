import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/Weather%20cubit/weather%20cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

import '../providers/weather provider.dart';
class Search_screen extends StatelessWidget {
String? cityname;

Search_screen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.orange,
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onChanged: (data){
              cityname=data;
            },
            onSubmitted: (data)async{
              cityname=data;

              BlocProvider.of<WeatherCubit>(context).GetWeather(cityname!);
              //BlocProvider.of<WeatherCubit>(context).city=cityname;

              Navigator.pop(context);

            },
            decoration: InputDecoration(
              hintText: 'enter a city',
              border: OutlineInputBorder(),
              label: Text('search'),
              suffixIcon: GestureDetector(
                onTap:()async{
                  BlocProvider.of<WeatherCubit>(context).GetWeather(cityname!);
                  Navigator.pop(context);
                } ,
                  child: Icon(Icons.search)
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 10),

            ),
          ),
        ),
      ),
    );
  }
}


