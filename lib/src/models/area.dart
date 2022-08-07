part of 'models.dart';

class Area extends Equatable {
  final String id;
  final String nameId;
  final String nameEn;
  final double lat;
  final double long;
  final String type;
  final int level;
  final String description;
  final String domain;
  final String? region;
  final String? tags;
  final List<Parameter> parameters;

  const Area({
    required this.id,
    required this.nameEn,
    required this.nameId,
    required this.lat,
    required this.long,
    required this.type,
    required this.level,
    required this.description,
    required this.domain,
    this.region,
    this.tags,
    required this.parameters,
  });

  Coordinate get coordinate => Coordinate(lat: lat, long: long);

  factory Area.fromXML(
    XmlElement xmlElement, {
    List<FilterParameter>? filterParameters,
  }) {
    final xmlAttributes = xmlElement.attributes;
    final names = xmlElement.findAllElements('name');
    final xmlParameters = xmlElement.findElements('parameter');
    final parameters = List.generate(
      xmlParameters.length,
      (index) {
        return Parameter.fromXML(
          xmlParameters.elementAt(index),
        );
      },
    );

    if (filterParameters != null && filterParameters.isNotEmpty) {
      final filterParametersId = List.generate(filterParameters.length,
          (index) => filterParameters[index].parameterId);

      // If filterParametersId is'not same with FilterParameter items length
      // It will do the filtering
      if (!(filterParametersId.length == FilterParameter.values.length)) {
        parameters.removeWhere((e) => !filterParametersId.contains(e.id));
      }
    }

    return Area(
      id: xmlAttributes.value('id')!,
      nameEn: names.first.text,
      nameId: names.last.text,
      lat: double.parse(xmlAttributes.value('latitude')!),
      long: double.parse(xmlAttributes.value('longitude')!),
      type: xmlAttributes.value('type')!,
      level: int.parse(xmlAttributes.value('level')!),
      description: xmlAttributes.value('description')!,
      domain: xmlAttributes.value('domain')!,
      region: xmlAttributes.value('region'),
      tags: xmlAttributes.value('tags'),
      parameters: parameters,
    );
  }

  Area copyWith({
    String? id,
    String? nameId,
    String? nameEn,
    double? lat,
    double? long,
    String? type,
    int? level,
    String? description,
    String? domain,
    String? region,
    String? tags,
    List<Parameter>? parameters,
  }) =>
      Area(
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        nameId: nameId ?? this.nameId,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        type: type ?? this.type,
        level: level ?? this.level,
        description: description ?? this.description,
        domain: domain ?? this.domain,
        parameters: parameters ?? this.parameters,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        nameEn,
        nameId,
        lat,
        long,
        type,
        level,
        description,
        domain,
        region,
        tags,
        parameters,
      ];
}
