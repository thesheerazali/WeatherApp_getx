class WeatherModel {
  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.name,
    required this.cod,
    required String cityName,
  });
  Coord coord = Coord(lon: 0.0, lat: 0.0);
  List<Weather> weather = [];
  String base = "";
  Main main = Main(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 0.0, pressure: 0, humidity: 0, seaLevel: 0, grndLevel: 0);
  int visibility = 0;
  Wind wind = Wind(speed: 0.0, deg: 0);
  Clouds clouds = Clouds(all: 0);
  int dt = 0;
  Sys sys = Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0);

  String name ="";
int cod = 0;

  WeatherModel.empty();

  WeatherModel.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord'] ?? {});

    final weatherJson =
        json['weather'] as List<dynamic>?; // Check if 'weather' key is present
    weather = weatherJson != null
        ? List<Weather>.from(weatherJson.map((x) => Weather.fromJson(x)))
        : [];
    base = json['base'] ?? '';
    main = Main.fromJson(json['main'] ?? {});
    visibility = json['visibility'] ?? 0;
    wind = Wind.fromJson(json['wind'] ?? {});
    clouds = Clouds.fromJson(json['clouds'] ?? {});
    dt = json['dt'];
    sys = Sys.fromJson(json['sys'] ?? {});
  // Provide a default value if necessary
    name = json['name'] ?? '';
    cod = json['cod'] ?? 0; // Provide a default value if necessary
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coord'] = coord.toJson();
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['base'] = base;
    _data['main'] = main.toJson();
    _data['visibility'] = visibility;
    _data['wind'] = wind.toJson();
    _data['clouds'] = clouds.toJson();
    _data['dt'] = dt;
    _data['sys'] = sys.toJson();
   
    _data['name'] = name;
    _data['cod'] = cod;
    return _data;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });
  late final double lon;
  late final double lat;

  Coord.fromJson(Map<String, dynamic> json) {
    lon = (json['lon'] as num?)?.toDouble() ?? 0.0;
    lat = (json['lat'] as num?)?.toDouble() ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class Weather {
  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon,
      required this.path});
  late final int id;
  late final String main;
  late final String description;
  late final String icon;
  String path = '';

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
    path = "assets/weather/$icon.png";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;

    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required int seaLevel,
    required int grndLevel,
  });
  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int humidity;

  Main.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] as num?)?.toDouble() ??
        0.0; // Provide a default value if necessary
    feelsLike = (json['feels_like'] as num?)?.toDouble() ??
        0.0; // Provide a default value if necessary
    tempMin = (json['temp_min'] as num?)?.toDouble() ??
        0.0; // Provide a default value if necessary
    tempMax = (json['temp_max'] as num?)?.toDouble() ??
        0.0; // Provide a default value if necessary
    pressure =
        (json['pressure'] as int?) ?? 0; // Provide a default value if necessary
    humidity =
        (json['humidity'] as int?) ?? 0; // Provide a default value if necessary
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    return _data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });
  late final double speed;
  late final int deg;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    return _data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
  late final int type;
  late final int id;
  late final String country;
  late final int sunrise;
  late final int sunset;
  //  "https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$apiKey";
  //    final RxDouble _latitude = 0.0.obs;
  // final RxDouble _latitude = 0.0.obs;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] ?? 0, // Provide a default value if necessary
        id: json['id'] ?? 0, // Provide a default value if necessary
        country: json['country'] ?? '',
        sunrise: json['sunrise'] ?? 0,
        sunset: json['sunset'] ?? 0,
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['id'] = id;
    _data['country'] = country;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}
