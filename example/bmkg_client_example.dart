import 'package:bmkg_client/bmkg_client.dart';

void main() async {
  final client = BMKGClient();
  final results = await client.getProvinceWeather(
    Province.Indonesia,
    filterParameters: [
      FilterParameter.Weather,
    ],
  );

  if (results == null) return;
  for (var i in results) {
    print(i);
  }
}
