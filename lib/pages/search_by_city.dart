import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_obj.dart';
import 'package:weather_app/utils/constant_api.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/extension/page_navigation.dart';
import 'package:weather_app/utils/text_style.dart';
import 'package:weather_app/widgets/items_card.dart';


class SearchByCity extends StatefulWidget {
  const SearchByCity({Key? key}) : super(key: key);

  @override
  _SearchByCityState createState() => _SearchByCityState();
}

class _SearchByCityState extends State<SearchByCity> {
  TextEditingController _controller = TextEditingController();
  WeatherObj? _weatherObj;
  bool isNight = true;
  String error = '';

  getCityData(String cityName) async  {
    var url = Uri.parse("$BASE_URL?q=$cityName&appid=$APP_ID&units=metric");
    http.Response response = await http.get(url);
    print(response.body);
    if(response.statusCode==200){
      setState(() {
        _weatherObj=WeatherObj.fromJson(jsonDecode(response.body));
        error ='';
      });
    }else{
      setState(() {
        error = 'Not found the city name!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int hour = DateTime.now().hour;
    if(hour>6 && hour<= 18){
      isNight=false;
    }else{
      isNight = true;
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
                child: Image.asset(isNight
                  ?'assets/images/night1.png'
                  :'assets/images/day1.png',
                  fit: BoxFit.cover,)
              ),
          ),
          Column(
            children: [
              SizedBox(height: height*0.1,),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextField(
                          style: TextStyle(color: Colors.white,fontSize: 25),
                          controller: _controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10,bottom: 10),
                            labelText: 'City Name',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                  IconButton(
                    icon: Icon(Icons.search,color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        getCityData(_controller.text);
                      });
                    },
                  ),
                ],
              ),
              error!=''?Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Text(error, style: allText,),
                  )):
              _weatherObj==null?Container():Expanded(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network("http://openweathermap.org/img/wn/${_weatherObj!.weather[0].icon}.png",
                            ),
                            Text(_weatherObj!.weather[0].main,
                              style: allText,
                            ),
                          ],
                        ),
                        Text('${double.parse(_weatherObj!.main!.temp).
                        toStringAsFixed(0)}/${double.parse(_weatherObj!.main!.feelsLike).
                        toStringAsFixed(0)}'+" ºC",
                          style: allText,
                        ),
                        Text(_weatherObj!.weather[0].description,
                          style: allText,
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    ItemsCard(
                        label: 'Humidity',
                        condition: _weatherObj!.main!.humidity.toString(),
                         units: '%',
                     ),
                    ItemsCard(
                      label: 'FeelsLike',
                      condition: _weatherObj!.main!.feelsLike.toString(),
                      units: 'ºC',
                    ),
                    ItemsCard(
                      label: 'Temp Min',
                      condition: _weatherObj!.main!.tempMin.toString(),
                      units: 'ºC',
                    ),
                    ItemsCard(
                      label: 'Temp Max',
                      condition: _weatherObj!.main!.tempMax.toString(),
                      units: 'ºC',
                    ),
                    ItemsCard(
                      label: 'Sunrise',
                      condition: DateFormat().add_jm().format(
                          DateTime.fromMillisecondsSinceEpoch(int.parse(_weatherObj!.sys!.sunrise))),
                      units: 'hrs',
                    ),
                    ItemsCard(
                      label: 'Sunset',
                      condition: DateFormat().add_jm().format(
                          DateTime.fromMillisecondsSinceEpoch(int.parse(_weatherObj!.sys!.sunset))),
                      units: 'hrs',
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: height*0.05,left: width*0.04,
            child: IconButton(
              onPressed: (){
                context.pop();
              },
              icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white,),
            ),
          )
        ],
      )
    );
  }
}
