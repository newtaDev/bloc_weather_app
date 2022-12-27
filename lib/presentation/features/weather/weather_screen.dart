import 'package:bloc_weather_app/cubits/auth/auth_cubit.dart';
import 'package:bloc_weather_app/presentation/routers/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_weather_app/presentation/features/weather/cubit/weather_forcast_cubit.dart';
import 'package:bloc_weather_app/presentation/features/weather/widgets/weather_layout.dart';
import 'package:go_router/go_router.dart';

class WeatherForcastScreen extends StatefulWidget {
  final String city;
  const WeatherForcastScreen({super.key, required this.city});

  @override
  State<WeatherForcastScreen> createState() => _WeatherForcastScreenState();
}

class _WeatherForcastScreenState extends State<WeatherForcastScreen> {
  @override
  void initState() {
    context.read<WeatherForcastCubit>().getWeatherDeatils(widget.city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff100f14),
      appBar: AppBar(
        actions: [
          TextButton.icon(
              onPressed: () {
                context.read<AuthCubit>().logoutUser();
                context.goNamed(Routes.signInScreen.name);
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: BlocBuilder<WeatherForcastCubit, WeatherForcastState>(
        builder: (context, state) {
          if (state.status.isInitial || state.status.isLoading) {
            return const Center(
                child: CupertinoActivityIndicator(
              color: Colors.white,
            ));
          }
          if (state.status.isError) {
            return Center(
                child: Text(
              state.error!.message,
              style: const TextStyle(color: Colors.white),
            ));
          }
          return WeatherForcastLayout(weatherForcastRes: state.weather!);
        },
      ),
    );
  }
}
