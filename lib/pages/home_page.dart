import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:weather_app/models/weather_obj.dart';
import 'package:weather_app/pages/daily_weather_page.dart';
import 'package:weather_app/pages/info_page.dart';
import 'package:weather_app/pages/search_by_city.dart';
import 'package:weather_app/utils/constant_api.dart';
import 'package:weather_app/utils/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/extension/page_navigation.dart';
import 'package:weather_app/widgets/weather_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherObj? _weatherObj;
  double lat = 0.0;
  double long = 0.0;
  bool isNight = true;
  bool isLoading = true;


  @override
  void initState(){
    super.initState();
    getLocation();
  }
  getLocation() async {
    Location location = new Location();
    location.enableBackgroundMode(enable: true);

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    lat = _locationData.latitude!;
    long = _locationData.longitude!;
    var url = Uri.parse("$BASE_URL?lat=$lat&lon=$long&appid=$APP_ID&units=metric");
    http.Response response = await http.get(url);
    print(response.body);
    if(response.statusCode==200){
        setState(() {
          _weatherObj=WeatherObj.fromJson(jsonDecode(response.body));
          isLoading= false;
        });
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int hour = DateTime.now().hour;
    if(hour>6&& hour<=18){
      isNight = false;
    }
    else{
      isNight = true;
    }
    return Scaffold(
      body: isLoading?Container(
        child: Center(child: CircularProgressIndicator(),),
      ):_weatherObj==null?Container():Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(isNight
                  ?'assets/images/night1.png'
                  :'assets/images/day1.png',
                fit: BoxFit.cover,
              )
            ),),
          Positioned(
              top: height*0.04,left: width*0.04,
              child: IconButton(
                onPressed: (){
                  context.pushPage(InfoPage());
                },
                icon: Icon(Icons.menu,color: Colors.white,),
              )),
          //for city name and datetime.
          Positioned(
            top: height*0.09, left: width*0.06,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_weatherObj!.name.toString(),
                  style: cityStyle,),
                  SizedBox(height: height*0.005,),
                  Text(DateFormat('EEEE dd, MMMM').format(DateTime.now()),
                    style: allText,
                  ),
                  SizedBox(height: height*0.005,),
                  Text(DateFormat().add_jm().format(DateTime.now()),
                    style: allText,
                  ),
                  SizedBox(height: height*0.005,),
                  InkWell(
                    onTap: (){
                      context.pushPage(DailyWeatherPage(
                        lat: lat,
                        long: long,
                      ));
                    },
                    child: Text('7 day forecast',
                      style: foreCast,
                    ),
                  )
                ],
              ),
          ),
          Positioned(
            top: height*0.83, right: width*0,left: 0,
            child: WeatherCard(
              label: 'Humidity',
              humidity: _weatherObj!.main!.humidity.toString()+" %",
              label1: 'Visibility',
              visible: _weatherObj!.visibility.toString(),
              label2: 'WindSpeed',
              windSpeed: _weatherObj!.wind!.speed.toString()+" m/s",
              color: isNight
                  ?Colors.indigo.withOpacity(0.1)
                  :Colors.purple.withOpacity(0.1),
            )
          ),
          Positioned(
            top: height*0.08,right: width*0.04,
              child: IconButton(
                onPressed: (){
                  context.pushPage(SearchByCity());
                },
                icon: Icon(Icons.search,color: Colors.white,),
              )),
          Positioned(
            top: height*0.25,right: width*0.06,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.network("http://openweathermap.org/img/wn/${_weatherObj!.weather[0].icon}@2x.png",),
                  Text(_weatherObj!.weather[0].main,
                    style: cityStyle,
                  ),
                ],
              ),
              Text(double.parse(_weatherObj!.main!.temp).toStringAsFixed(0)+"ºC",
                style: tempStyle,),
            ],
           ),
          ),
        ],
      )
    );
  }
}
