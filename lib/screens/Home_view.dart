import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/Weather%20cubit/weather%20cubit.dart';
import 'package:weather_app/cubits/Weather%20cubit/weather%20state.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

import '../models/weather_model.dart';
import '../providers/weather provider.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
   HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
   weatherData=BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Search_screen();
                }));
              },
              icon:Icon(Icons.search)),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit,WeatherState> (
        builder: (context, state)
        {
          if(state is WeatherLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is WeatherSuccess){
            return WeatherInfoBody();
          }
          else if (state is WeatherFailure){
            return Center(child: Text('wrong try again'),);
          }
          else{
            return  NoWeatherBody();
          }
        },

      )

    );
  }
}
