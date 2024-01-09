import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../bloc/weather_app_bloc.dart';

Widget buildSuccessUI(double height, double width, WeatherAppSuccess state) {
  return SizedBox(
    height: height,
    width: width,
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            '📍 ${state.weather.areaName}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Good Morning',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Image.asset(
          "assets/3.png",
          width: width * .75,
        ),
        Text(
          '${state.weather.temperature!.celsius!.round()}°C',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 70,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          state.weather.weatherMain!.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  );
}
