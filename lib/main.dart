import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/Weather%20cubit/weather%20cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/Home_view.dart';
import 'package:weather_app/service/weather_service.dart';
import 'providers/weather provider.dart';

void main() {
  runApp(
    BlocProvider(
          create:(context){
            return WeatherCubit(WeatherService());
          },
          child: WeatherApp()
  ),
  );
}

class WeatherApp extends StatelessWidget {
   WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:BlocProvider.of<WeatherCubit>(context).weatherModel==null?Colors.blue:
        BlocProvider.of<WeatherCubit>(context).weatherModel!.getcolor(),

        //brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
