import 'dart:ui';

import 'package:bloc_flutter_learning/weather/bloc/weather_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';

class BodyWeather extends StatelessWidget {
  const BodyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
        // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.3 * kToolbarHeight, 40, 20),
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(2, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-2, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -1),
              child: Container(
                height: 300,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherSuccess) {
                  print(state.weather);
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.location_circle_fill,
                              color: Colors.blue,
                            ),
                            const Gap(5),
                            Text(
                              state.weather.areaName.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          "morning".toUpperCase(),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Gap(20),
                        Center(
                            child: Image.network(
                                "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg")),
                        const Gap(20),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "${state.weather.temperature!.celsius!.round()}°C",
                                  style: GoogleFonts.roboto(
                                    fontSize: 55,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  state.weather.weatherDescription
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  DateFormat("MMMM d - ")
                                      .add_jm()
                                      .format(state.weather.date!),
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        leading: const Icon(
                                            CupertinoIcons.sunrise_fill),
                                        title: const Text("sunrise"),
                                        subtitle: Text(
                                          "${DateFormat().add_jm().format(state.weather.sunrise!)}°C",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        leading: const Icon(
                                            CupertinoIcons.sunset_fill),
                                        title: const Text("sunset"),
                                        subtitle: Text(
                                          "${DateFormat().add_jm().format(state.weather.sunrise!)}°C",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.grey),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        leading:
                                            const Icon(CupertinoIcons.flame),
                                        title: const Text("T°C Max"),
                                        subtitle: Text(
                                          "${state.weather.tempMax!.celsius!.round()}°C",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        leading:
                                            const Icon(CupertinoIcons.snow),
                                        title: const Text("T°C Min"),
                                        subtitle: Text(
                                          "${state.weather.tempMin!.celsius!.round()}°C",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
