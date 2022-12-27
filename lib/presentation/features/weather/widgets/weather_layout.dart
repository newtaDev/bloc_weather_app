import 'package:bloc_weather_app/shared/extensions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/models/response/weather_forcast_res/weather_forcast_res.dart';
import '../../../../shared/assets/assets.dart';

class WeatherForcastLayout extends StatelessWidget {
  final WeatherForcastRes weatherForcastRes;
  const WeatherForcastLayout({
    Key? key,
    required this.weatherForcastRes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityName = weatherForcastRes.name;
    final country = weatherForcastRes.sys?.country;
    final dateTime = weatherForcastRes.dt;
    final temp = weatherForcastRes.main?.temp;
    final tempdesc = weatherForcastRes.weather?[0].main ?? 'Smoke';
    final humidity = weatherForcastRes.main?.humidity;
    final wind = weatherForcastRes.wind?.speed;
    final visi = weatherForcastRes.visibility ?? 0 / 1000;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 30, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(dateTime! * 1000)
                        .toReadableString(),
                    style: const TextStyle(color: Color(0xffe3e3e3)),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${cityName?.toUpperCase()}, $country',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                ImgAssets.map,
                fit: BoxFit.fill,
                color: const Color(0xff29292b),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Image.asset(getWeatherImage(tempdesc)),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            tempdesc,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temp?.toStringAsFixed(0) ?? 'N/A',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 92,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'º',
              style: TextStyle(color: Color(0xfffcdd73), fontSize: 72),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Colors.white24,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                formText(SvgAssets.windSoild, '${wind}km/h', 'Wind'),
                formText(
                  SvgAssets.humiSolid,
                  '$humidity%',
                  'Humidity',
                ),
                formText(
                  SvgAssets.visiSolid,
                  '${visi.toStringAsFixed(0)}km',
                  'Visibility',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  String getWeatherImage(String weatherType) {
    switch (weatherType) {
      case 'Clear':
        {
          return ImgAssets.clearAm;
        }
      case 'Clouds':
        {
          return ImgAssets.cloudsAm;
        }
      case 'Rain':
        {
          return ImgAssets.rain;
        }
      case 'Snow':
        {
          return ImgAssets.snow;
        }
      case 'Smoke':
        {
          return ImgAssets.smoke;
        }
      default:
        {
          return ImgAssets.smoke;
        }
    }
  }

  Widget formText(
    String svgAssets,
    String value,
    String label,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            svgAssets,
            color: Colors.white,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white54),
        ),
      ],
    );
  }
}
