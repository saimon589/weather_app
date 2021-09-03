import 'package:flutter/material.dart';
import 'package:weather_app/extension/page_navigation.dart';
import 'package:weather_app/utils/text_style.dart';
import 'package:weather_app/widgets/items_card.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool isNight = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    int hour = DateTime.now().hour;
    if(hour>6 && hour<=18){
      setState(() {
        isNight = false;
      });
    }
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                    child: Image.asset(isNight
                        ? 'assets/images/night1.png'
                        : 'assets/images/day1.png',
                      fit: BoxFit.cover,
                    ),
                  ),),
              Positioned(
                  top: height*0.06,left: width*0.04,
                  child: IconButton(
                    onPressed: (){
                      context.pop();
                    },
                    icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white,),
                  )),
              Column(
                children: [
                  SizedBox(height: 80,),
                  Image.asset('assets/images/weather.png',
                    height: height*0.1,
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(""" OpenWeatherMap is an online service, owned by OpenWeather Ltd, that provides global weather data via API, including current weather data, forecasts, nowcasts and historical weather data for any geographical location. The company provides a minute-by-minute hyperlocal precipitation forecast for any location. The convolutional machine learning model is used to utilise meteorological broadcast services and data from airport weather stations, on-ground radar stations, weather satellites, remote sensing satellites, METAR and automated weather stations.

The company has more than 2 million customers, ranging from independent developers to Fortune 500 companies.[1]

The variety of weather APIs provided by OpenWeatherMap have found a significant popularity among the software developers, which resulted in the growing multitude of repositories on GitHub.[2] The APIs support multiple languages, units of measurement and industry standard data formats like JSON and XML.

In 2021, OpenWeatherMap launched a number of initiatives to support students, researchers and developers across the world.  """,
                      style: allText,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
