import 'package:flutter/material.dart';
import 'package:weather_app/utils/text_style.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key,required this.label,required this.color,
    this.label1,this.label2,this.humidity,this.visible,
    required this.windSpeed}) : super(key: key);
  final label;
  final humidity;
  final label1;
  final visible;
  final label2;
  final windSpeed;
  final color;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.1,
      width: width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white24,
          width: 1.0
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(humidity,style: allNumber,),
              Text(label,style: allText),
            ],
          ),
          VerticalDivider(thickness: 2,),
          Column(
            children: [
              Text(visible,style: allNumber,),
              Text(label1,style: allText,),
            ],
          ),
          VerticalDivider(thickness: 2,),
          Column(
            children: [
              Text(windSpeed,style: allNumber,),
              Text(label2,style: allText,),
            ],
          ),
        ],
      ),
    );
  }
}
