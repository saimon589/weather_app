import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/extension/page_navigation.dart';
import 'package:weather_app/models/daily_weather_obj.dart';
import 'package:weather_app/utils/constant_api.dart';
import 'package:weather_app/utils/text_style.dart';
import 'package:weather_app/widgets/daily_weather_card.dart';
import 'package:http/http.dart' as http;


class DailyWeatherPage extends StatefulWidget {
  const DailyWeatherPage({Key? key,this.lat, this.long}) : super(key: key);
  final lat;
  final long;

  @override
  _DailyWeatherPageState createState() => _DailyWeatherPageState();
}

class _DailyWeatherPageState extends State<DailyWeatherPage> {
  DailyWeatherObj? _dwo;
  bool isLoading = true;
  bool isNight = true;
  
  getDailyWeather()async{
    var url = Uri.parse("$DAILY_BASE_URL?lat=${widget.lat}&lon=${widget.long}&exclude=minutely,hourly,monthly&appid=$APP_ID&units=metric");
    http.Response response = await http.get(url);
    print(response.body);
    if(response.statusCode==200){
      setState(() {
        _dwo=DailyWeatherObj.fromJson(jsonDecode(response.body));
        isLoading= false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getDailyWeather();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int hour = DateTime.now().hour;
    if(hour>6 && hour<=18){
      isNight = false;
    }else{
      isNight = true;
    }
    return Scaffold(
        body: isLoading?Container(
          child: Center(child: CircularProgressIndicator(),),
        ):_dwo==null?Container() : Stack(
          children: [
            Positioned.fill(
              child: Container(
                child:
                    Image.asset(isNight
                      ?'assets/images/night1.png'
                      :'assets/images/day1.png',
                  fit: BoxFit.cover,)
              ),),
            Positioned(
                top: height*0.06,left: width*0.04,
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        child: Icon(Icons.keyboard_backspace_rounded,
                          color: Colors.white,
                        ),
                      ),
                      onTap: (){
                        context.pop();
                      },
                    ),
                    SizedBox(width: width*0.1,),
                    Text('7 day weather forecast',style: allText,)
                  ],
                ),
            ),
            Column(
              children: [
                SizedBox(height: height*0.1,
                ),
                  Expanded(child: ListView.builder(
                   itemCount: _dwo!.daily.length,
                   itemBuilder: (context, index){
                  return DailyWeatherCard(daily: _dwo!.daily[index]);
                 }),),
              ],
            )
          ],
        )
    );
  }
}
