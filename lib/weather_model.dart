

import 'dart:convert';
//https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/38.9697,-77.385?key=UE6YCZ9APHQ7KFXKBQPDDP8DW

class Weather {
  int queryCost;
  double latitude;
  double longitude;
  String resolvedAddress;
  String address;
  String timezone;
  int tzoffset;
  String description;
  List<CurrentConditions> days;
  List<Alert> alerts;
  Map<String, Station> stations;
  CurrentConditions currentConditions;

  Weather({
    required this.queryCost,
    required this.latitude,
    required this.longitude,
    required this.resolvedAddress,
    required this.address,
    required this.timezone,
    required this.tzoffset,
    required this.description,
    required this.days,
    required this.alerts,
    required this.stations,
    required this.currentConditions,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    queryCost: json["queryCost"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    resolvedAddress: json["resolvedAddress"],
    address: json["address"],
    timezone: json["timezone"],
    tzoffset: json["tzoffset"],
    description: json["description"],
    days: List<CurrentConditions>.from(json["days"].map((x) => CurrentConditions.fromJson(x))),
    alerts: List<Alert>.from(json["alerts"].map((x) => Alert.fromJson(x))),
    stations: Map.from(json["stations"]).map((k, v) => MapEntry<String, Station>(k, Station.fromJson(v))),
    currentConditions: CurrentConditions.fromJson(json["currentConditions"]),
  );

  Map<String, dynamic> toJson() => {
    "queryCost": queryCost,
    "latitude": latitude,
    "longitude": longitude,
    "resolvedAddress": resolvedAddress,
    "address": address,
    "timezone": timezone,
    "tzoffset": tzoffset,
    "description": description,
    "days": List<dynamic>.from(days.map((x) => x.toJson())),
    "alerts": List<dynamic>.from(alerts.map((x) => x.toJson())),
    "stations": Map.from(stations).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "currentConditions": currentConditions.toJson(),
  };
}

class Alert {
  String event;
  String headline;
  DateTime ends;
  int endsEpoch;
  DateTime onset;
  int onsetEpoch;
  String id;
  String language;
  String link;
  String description;

  Alert({
    required this.event,
    required this.headline,
    required this.ends,
    required this.endsEpoch,
    required this.onset,
    required this.onsetEpoch,
    required this.id,
    required this.language,
    required this.link,
    required this.description,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
    event: json["event"],
    headline: json["headline"],
    ends: DateTime.parse(json["ends"]),
    endsEpoch: json["endsEpoch"],
    onset: DateTime.parse(json["onset"]),
    onsetEpoch: json["onsetEpoch"],
    id: json["id"],
    language: json["language"],
    link: json["link"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "event": event,
    "headline": headline,
    "ends": ends.toIso8601String(),
    "endsEpoch": endsEpoch,
    "onset": onset.toIso8601String(),
    "onsetEpoch": onsetEpoch,
    "id": id,
    "language": language,
    "link": link,
    "description": description,
  };
}

class CurrentConditions {
  String datetime;
  int datetimeEpoch;
  double temp;
  double feelslike;
  double humidity;
  double dew;
  double? precip;
  double precipprob;
  int? snow;
  double snowdepth;
  List<Icon>? preciptype;
  double windgust;
  double windspeed;
  double winddir;
  double pressure;
  double visibility;
  double cloudcover;
  double solarradiation;
  double solarenergy;
  int uvindex;
  Conditions conditions;
  Icon icon;
  List<String>? stations;
  Source source;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  double? tempmax;
  double? tempmin;
  double? feelslikemax;
  double? feelslikemin;
  double? precipcover;
  int? severerisk;
  String? description;
  List<CurrentConditions>? hours;

  CurrentConditions({
    required this.datetime,
    required this.datetimeEpoch,
    required this.temp,
    required this.feelslike,
    required this.humidity,
    required this.dew,
    required this.precip,
    required this.precipprob,
    required this.snow,
    required this.snowdepth,
    required this.preciptype,
    required this.windgust,
    required this.windspeed,
    required this.winddir,
    required this.pressure,
    required this.visibility,
    required this.cloudcover,
    required this.solarradiation,
    required this.solarenergy,
    required this.uvindex,
    required this.conditions,
    required this.icon,
    required this.stations,
    required this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.tempmax,
    this.tempmin,
    this.feelslikemax,
    this.feelslikemin,
    this.precipcover,
    this.severerisk,
    this.description,
    this.hours,
  });

  factory CurrentConditions.fromJson(Map<String, dynamic> json) => CurrentConditions(
    datetime: json["datetime"],
    datetimeEpoch: json["datetimeEpoch"],
    temp: json["temp"]?.toDouble(),
    feelslike: json["feelslike"]?.toDouble(),
    humidity: json["humidity"]?.toDouble(),
    dew: json["dew"]?.toDouble(),
    precip: json["precip"]?.toDouble(),
    precipprob: json["precipprob"]?.toDouble(),
    snow: json["snow"],
    snowdepth: json["snowdepth"]?.toDouble(),
    preciptype: json["preciptype"] == null ? [] : List<Icon>.from(json["preciptype"]!.map((x) => iconValues.map[x]!)),
    windgust: json["windgust"]?.toDouble(),
    windspeed: json["windspeed"]?.toDouble(),
    winddir: json["winddir"]?.toDouble(),
    pressure: json["pressure"]?.toDouble(),
    visibility: json["visibility"]?.toDouble(),
    cloudcover: json["cloudcover"]?.toDouble(),
    solarradiation: json["solarradiation"]?.toDouble(),
    solarenergy: json["solarenergy"]?.toDouble(),
    uvindex: json["uvindex"],
    conditions: conditionsValues.map[json["conditions"]]!,
    icon: iconValues.map[json["icon"]]!,
    stations: json["stations"] == null ? [] : List<String>.from(json["stations"]!.map((x) => x)),
    source: sourceValues.map[json["source"]]!,
    sunrise: json["sunrise"],
    sunriseEpoch: json["sunriseEpoch"],
    sunset: json["sunset"],
    sunsetEpoch: json["sunsetEpoch"],
    moonphase: json["moonphase"]?.toDouble(),
    tempmax: json["tempmax"]?.toDouble(),
    tempmin: json["tempmin"]?.toDouble(),
    feelslikemax: json["feelslikemax"]?.toDouble(),
    feelslikemin: json["feelslikemin"]?.toDouble(),
    precipcover: json["precipcover"]?.toDouble(),
    severerisk: json["severerisk"],
    description: json["description"],
    hours: json["hours"] == null ? [] : List<CurrentConditions>.from(json["hours"]!.map((x) => CurrentConditions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "datetime": datetime,
    "datetimeEpoch": datetimeEpoch,
    "temp": temp,
    "feelslike": feelslike,
    "humidity": humidity,
    "dew": dew,
    "precip": precip,
    "precipprob": precipprob,
    "snow": snow,
    "snowdepth": snowdepth,
    "preciptype": preciptype == null ? [] : List<dynamic>.from(preciptype!.map((x) => iconValues.reverse[x])),
    "windgust": windgust,
    "windspeed": windspeed,
    "winddir": winddir,
    "pressure": pressure,
    "visibility": visibility,
    "cloudcover": cloudcover,
    "solarradiation": solarradiation,
    "solarenergy": solarenergy,
    "uvindex": uvindex,
    "conditions": conditionsValues.reverse[conditions],
    "icon": iconValues.reverse[icon],
    "stations": stations == null ? [] : List<dynamic>.from(stations!.map((x) => x)),
    "source": sourceValues.reverse[source],
    "sunrise": sunrise,
    "sunriseEpoch": sunriseEpoch,
    "sunset": sunset,
    "sunsetEpoch": sunsetEpoch,
    "moonphase": moonphase,
    "tempmax": tempmax,
    "tempmin": tempmin,
    "feelslikemax": feelslikemax,
    "feelslikemin": feelslikemin,
    "precipcover": precipcover,
    "severerisk": severerisk,
    "description": description,
    "hours": hours == null ? [] : List<dynamic>.from(hours!.map((x) => x.toJson())),
  };
}

enum Conditions {
  CLEAR,
  OVERCAST,
  PARTIALLY_CLOUDY,
  RAIN_OVERCAST,
  RAIN_PARTIALLY_CLOUDY
}

final conditionsValues = EnumValues({
  "Clear": Conditions.CLEAR,
  "Overcast": Conditions.OVERCAST,
  "Partially cloudy": Conditions.PARTIALLY_CLOUDY,
  "Rain, Overcast": Conditions.RAIN_OVERCAST,
  "Rain, Partially cloudy": Conditions.RAIN_PARTIALLY_CLOUDY
});

enum Icon {
  CLEAR_DAY,
  CLEAR_NIGHT,
  CLOUDY,
  FOG,
  PARTLY_CLOUDY_DAY,
  PARTLY_CLOUDY_NIGHT,
  RAIN
}

final iconValues = EnumValues({
  "clear-day": Icon.CLEAR_DAY,
  "clear-night": Icon.CLEAR_NIGHT,
  "cloudy": Icon.CLOUDY,
  "fog": Icon.FOG,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
  "rain": Icon.RAIN
});

enum Source {
  COMB,
  FCST,
  OBS
}

final sourceValues = EnumValues({
  "comb": Source.COMB,
  "fcst": Source.FCST,
  "obs": Source.OBS
});

class Station {
  int distance;
  double latitude;
  double longitude;
  int useCount;
  String id;
  String name;
  int quality;
  int contribution;

  Station({
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.useCount,
    required this.id,
    required this.name,
    required this.quality,
    required this.contribution,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
    distance: json["distance"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    useCount: json["useCount"],
    id: json["id"],
    name: json["name"],
    quality: json["quality"],
    contribution: json["contribution"],
  );

  Map<String, dynamic> toJson() => {
    "distance": distance,
    "latitude": latitude,
    "longitude": longitude,
    "useCount": useCount,
    "id": id,
    "name": name,
    "quality": quality,
    "contribution": contribution,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
