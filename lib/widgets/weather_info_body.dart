import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/Weather%20cubit/weather%20cubit.dart';
import 'package:weather_app/models/weather_model.dart';


class WeatherInfoBody extends StatelessWidget {
   WeatherInfoBody();

//WeatherService? weatherData =WeatherService();
  WeatherModel? weatherdata;
  String? citye;
  String? image;
  @override
  Widget build(BuildContext context) {
    weatherdata=BlocProvider.of<WeatherCubit>(context).weatherModel;
   image=BlocProvider.of<WeatherCubit>(context).weatherModel!.getimage();
    citye=BlocProvider.of<WeatherCubit>(context).city;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherdata!.getcolor(),
            weatherdata!.getcolor()[300]!,
            weatherdata!.getcolor()[100]!,
          ],
              begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Spacer(flex: 3,),
          Text(citye!,
            style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Text('update:${weatherdata!.date}' ,
            style: TextStyle(fontSize: 15,
               ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image!),
              Text('${weatherdata!.avetemp.toInt()}',style: TextStyle(fontSize: 30),),

              Column(
                children: [
                  Text('max:  ${weatherdata!.maxtemp.toInt()}'),
                  Text('min:  ${weatherdata!.mintemp.toInt()}'),

                ],
              ),
            ],
          ),
          Spacer(),
          SizedBox(height: 20,),
          Text('${weatherdata!.state}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Spacer(flex: 5,),
        ],
      ),
    );
  }
}
