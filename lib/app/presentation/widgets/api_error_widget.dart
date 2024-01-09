import 'package:flutter/material.dart';

import '../../bloc/weather_app_bloc.dart';

Widget buildErrorUI(WeatherAppFailure state) {
  return Center(
    child: Text(
      'Error: ${state.errorMessage}',
      style: const TextStyle(
        color: Colors.red,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
