class DailyWeatherObj {
  late String lat;
  late String lon;
  late String timezone;
  late String timezoneOffset;
  late Current current;
  late List<Daily> daily;
  late List<Alerts> alerts;

  DailyWeatherObj(
      {required this.lat,
       required this.lon,
       required this.timezone,
       required this.timezoneOffset,
       required this.current,
       required this.daily,
       required this.alerts});

  DailyWeatherObj.fromJson(Map<String, dynamic> json) {
    lat = json['lat'].toString();
    lon = json['lon'].toString();
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'].toString();
    current = (json['current'] != null ? new Current.fromJson(json['current']) : null)!;
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily.add(new Daily.fromJson(v));
      });
    }
    if (json['alerts'] != null) {
      alerts = <Alerts>[];
      json['alerts'].forEach((v) {
        alerts.add(new Alerts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily.map((v) => v.toJson()).toList();
    }
    if (this.alerts != null) {
      data['alerts'] = this.alerts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Current {
  late String dt;
  late String sunrise;
  late String sunset;
  late String temp;
  late String feelsLike;
  late String pressure;
  late String humidity;
  late String dewPoint;
  late String uvi;
  late String clouds;
  late String visibility;
  late String windSpeed;
  late String windDeg;
  late String windGust;
  late List<Weather> weather;

  Current(
      {required this.dt,
        required this.sunrise,
        required this.sunset,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.dewPoint,
        required this.uvi,
        required this.clouds,
        required this.visibility,
        required this.windSpeed,
        required this.windDeg,
        required this.windGust,
        required this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'].toString();
    sunrise = json['sunrise'].toString();
    sunset = json['sunset'].toString();
    temp = json['temp'].toString();
    feelsLike = json['feels_like'].toString();
    pressure = json['pressure'].toString();
    humidity = json['humidity'].toString();
    dewPoint = json['dew_point'].toString();
    uvi = json['uvi'].toString();
    clouds = json['clouds'].toString();
    visibility = json['visibility'].toString();
    windSpeed = json['wind_speed'].toString();
    windDeg = json['wind_deg'].toString();
    windGust = json['wind_gust'].toString();
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['uvi'] = this.uvi;
    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    data['wind_gust'] = this.windGust;
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weather {
  late String id;
  late String main;
  late String description;
  late String icon;

  Weather({required this.id,required this.main,
    required this.description,required this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Daily {
  late String dt;
  late String sunrise;
  late String sunset;
  late String moonrise;
  late String moonset;
  late String moonPhase;
  late Temp temp;
  late FeelsLike feelsLike;
  late String pressure;
  late String humidity;
  late String dewPoint;
  late String windSpeed;
  late String windDeg;
  late String windGust;
  late List<Weather> weather;
  late String clouds;
  late String pop;
  late String uvi;
  late String rain;

  Daily(
      {required this.dt,
        required  this.sunrise,
        required  this.sunset,
        required  this.moonrise,
        required  this.moonset,
        required  this.moonPhase,
        required  this.temp,
        required  this.feelsLike,
        required  this.pressure,
        required  this.humidity,
        required  this.dewPoint,
        required  this.windSpeed,
        required  this.windDeg,
        required  this.windGust,
        required  this.weather,
        required  this.clouds,
        required  this.pop,
        required  this.uvi,
        required  this.rain});

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'].toString();
    sunrise = json['sunrise'].toString();
    sunset = json['sunset'].toString();
    moonrise = json['moonrise'].toString();
    moonset = json['moonset'].toString();
    moonPhase = json['moon_phase'].toString();
    temp = (json['temp'] != null ? new Temp.fromJson(json['temp']) : null)!;
    feelsLike = (json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : null)!;
    pressure = json['pressure'].toString();
    humidity = json['humidity'].toString();
    dewPoint = json['dew_point'].toString();
    windSpeed = json['wind_speed'].toString();
    windDeg = json['wind_deg'].toString();
    windGust = json['wind_gust'].toString();
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    clouds = json['clouds'].toString();
    pop = json['pop'].toString();
    uvi = json['uvi'].toString();
    rain = json['rain'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    if (this.feelsLike != null) {
      data['feels_like'] = this.feelsLike.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    data['wind_gust'] = this.windGust;
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this.clouds;
    data['pop'] = this.pop;
    data['uvi'] = this.uvi;
    data['rain'] = this.rain;
    return data;
  }
}

class Temp {
  late String day;
  late String min;
  late String max;
  late String night;
  late String eve;
  late String morn;

  Temp({required this.day,required this.min,required this.max,
    required this.night,required this.eve,required this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'].toString();
    min = json['min'].toString();
    max = json['max'].toString();
    night = json['night'].toString();
    eve = json['eve'].toString();
    morn = json['morn'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class FeelsLike {
  late String day;
  late String night;
  late String eve;
  late String morn;

  FeelsLike({required this.day,required this.night,
    required this.eve,required this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'].toString();
    night = json['night'].toString();
    eve = json['eve'].toString();
    morn = json['morn'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class Alerts {
  late String senderName;
  late String event;
  late String start;
  late String end;
  late String description;
  late List<String> tags;

  Alerts(
      {required this.senderName,
       required this.event,
       required this.start,
       required this.end,
       required this.description,
       required this.tags});

  Alerts.fromJson(Map<String, dynamic> json) {
    senderName = json['sender_name'];
    event = json['event'];
    start = json['start'].toString();
    end = json['end'].toString();
    description = json['description'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender_name'] = this.senderName;
    data['event'] = this.event;
    data['start'] = this.start;
    data['end'] = this.end;
    data['description'] = this.description;
    data['tags'] = this.tags;
    return data;
  }
}
