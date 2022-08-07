import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

import 'enums.dart';
import 'models/models.dart';

class BMKGClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://data.bmkg.go.id/DataMKG/MEWS/',
      connectTimeout: 15000,
      receiveTimeout: 10000,
    ),
  );

  Future<List<Area>?> getProvinceWeather(
    Province province, {
    List<FilterParameter>? filterParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.request<String>(
        'DigitalForecast/DigitalForecast-${province.name}.xml',
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.data == null) {
        throw Exception('Response data is null');
      }

      final xml = XmlDocument.parse(response.data!);

      final areaElements = xml.findAllElements('area');

      return List.generate(
        areaElements.length,
        (index) => Area.fromXML(
          areaElements.elementAt(index),
          filterParameters: filterParameters,
        ),
      );
    } catch (ex) {
      return null;
    }
  }
}
