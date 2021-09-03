import 'package:flutter/material.dart';
import 'package:weather_app/extension/page_navigation.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/utils/text_style.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), (){
      context.pushPage(HomePage());
    });
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.indigo,
                            Colors.indigoAccent,
                            Colors.blue,
                          ]
                      )
                  ),
                ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(vertical: height*0.13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/weather.png',
                          height: height*0.1,
                        ),
                        SizedBox(height: 10,),
                        Text('WeatherMap',style: cityStyle,),
                        SizedBox(height: 10,),
                        Text('Version (1.0.0)',style: allText,),
                      ],
                    ),
                  ),
                  ),
                  Expanded(child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white,),
                        SizedBox(height: 30,),
                        Text('Data provided the \nopenweathermap.com',
                          textAlign: TextAlign.center,
                          style: allText,
                        ),
                      ],
                    ),
                  ),
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
