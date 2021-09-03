import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/daily_weather_obj.dart';
import 'package:weather_app/utils/text_style.dart';

class DailyWeatherCard extends StatelessWidget {
  const DailyWeatherCard({Key? key,required this.daily}) : super(key: key);
  final Daily daily;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                backgroundColor: Colors.deepPurple,
                title: Text(DateFormat("EEEE dd, MMM").format(DateTime.fromMillisecondsSinceEpoch(int.parse(daily.dt)*1000)),
                  style: allText,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network("http://openweathermap.org/img/wn/${daily.weather[0].icon}@2x.png",
                    ),
                    Text(daily.weather[0].main.toString(),
                      style: allText,
                    ),
                    Text("Max Temperature : "+daily.temp.max,style: allText,),
                    Text("Min Temperature : "+daily.temp.min,style: allText,),
                    Text("Day Temperature : "+daily.temp.day,style: allText,),
                    Text("Night Temperature : "+daily.temp.night,style: allText,),
                    Text("Description : "+daily.weather[0].description,style: allText,),
                    Text("WindSpeed : "+daily.windSpeed,style: allText,),
                  ],
                ),
              );
            });
      },
      child: Container(
        height: height*0.15,
        width: width,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat("EEE").format(DateTime.fromMillisecondsSinceEpoch(int.parse(daily.dt)*1000)),
                  style: allText,
                ),
                Row(
                  children: [
                    Image.network("http://openweathermap.org/img/wn/${daily.weather[0].icon}.png",
                    ),
                    Text(daily.weather[0].main.toString(),
                      style: allText,
                    ),
                  ],
                ),
                Text("${double.parse(daily.temp.day).toStringAsFixed(0)}"+"/"+
                    "${double.parse(daily.feelsLike.day).toStringAsFixed(0)}",style: allText,),
              ],
            ),
            Divider(color: Colors.white24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat("dd, MMMM").format(DateTime.fromMillisecondsSinceEpoch(int.parse(daily.dt)*1000)),
                  style: allText,
                ),
                Text(daily.weather[0].description.toString(),
                  style: allText,
                ),
                Text(daily.humidity.toString()+' %',
                  style: allText,
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white24,
          )
        ),
      ),
    );
  }
}
