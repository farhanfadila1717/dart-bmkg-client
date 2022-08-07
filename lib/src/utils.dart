import 'package:xml/xml.dart';

import 'enums.dart';

extension XmlAttributeExtensions on List<XmlAttribute> {
  String? value(String name) {
    final value = firstWhere((e) => e.name.local == name).value;
    return value.isEmpty ? null : value;
  }
}

extension WeatherCodeExtension on WeatherCode {
  int get code {
    switch (this) {
      case WeatherCode.PartlyCloudy:
        return 1;
      case WeatherCode.MostlyCloudy:
        return 3;
      case WeatherCode.Overcast:
        return 4;
      case WeatherCode.Haze:
        return 5;
      case WeatherCode.Smoke:
        return 10;
      case WeatherCode.Fog:
        return 45;
      case WeatherCode.LightRain:
        return 60;
      case WeatherCode.Rain:
        return 61;
      case WeatherCode.HeavyRain:
        return 63;
      case WeatherCode.IsolatedShower:
        return 80;
      case WeatherCode.SevereThunderstorm:
        return 95;
      default:
        return 0;
    }
  }
}

extension CARDExtension on CARD {
  String get code {
    switch (this) {
      case CARD.NorthNortheast:
        return 'NNE';
      case CARD.Northeast:
        return 'NE';
      case CARD.EastNortheast:
        return 'ENE';
      case CARD.East:
        return 'E';
      case CARD.EastSoutheast:
        return 'ESE';
      case CARD.Southeast:
        return 'SE';
      case CARD.SouthSoutheast:
        return 'SSE';
      case CARD.South:
        return 'S';
      case CARD.SouthSouthwest:
        return 'SSW';
      case CARD.Southwest:
        return 'SW';
      case CARD.WestSouthwest:
        return 'WSW';
      case CARD.West:
        return 'W';
      case CARD.WestNorthwest:
        return 'WNW';
      case CARD.Northwest:
        return 'NW';
      case CARD.NorthNorthwest:
        return 'NNW';
      case CARD.VARIABLE:
        return 'VARIABLE';
      default:
        return 'N';
    }
  }
}

extension FilterParameterExtensions on FilterParameter {
  String get parameterId {
    switch (this) {
      case FilterParameter.Humidity:
        return 'hu';
      case FilterParameter.MinHumidity:
        return 'humin';
      case FilterParameter.MaxHumidity:
        return 'humax';
      case FilterParameter.MinAirTemperature:
        return 'tmin';
      case FilterParameter.MaxAirTemperature:
        return 'tmax';
      case FilterParameter.Temperature:
        return 't';
      case FilterParameter.WinSpeed:
        return 'ws';
      case FilterParameter.WindDirection:
        return 'wd';
      default:
        return 'weather';
    }
  }
}
