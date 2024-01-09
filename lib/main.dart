import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/bloc/weather_app_bloc.dart';

import 'app/core/functions/functions.dart';
import 'app/presentation/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.amber,
                radius: 15.0,
              ),
            );
          } else if (snapshot.hasData) {
            return BlocProvider<WeatherBlocBloc>(
              create: (context) => WeatherBlocBloc()
                ..add(FetchWeather(snapshot.data as Position)),
              child: const HomePage(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return const Offstage();
          }
        },
      ),
    );
  }
}
