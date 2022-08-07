part of 'models.dart';

class Parameter extends Equatable {
  final String id;
  final String description;
  final String type;
  final List<TimeRange> timeRanges;

  const Parameter({
    required this.id,
    required this.description,
    required this.type,
    required this.timeRanges,
  });

  factory Parameter.fromXML(XmlElement xmlElement) {
    final attributes = xmlElement.attributes;
    final timeRanges = xmlElement.findElements('timerange');
    return Parameter(
      id: attributes.value('id')!,
      description: attributes.value('description')!,
      type: attributes.value('type')!,
      timeRanges: List.generate(
        timeRanges.length,
        (index) => TimeRange.fromXML(
          timeRanges.elementAt(index),
        ),
      ),
    );
  }

  Parameter copyWith({
    String? id,
    String? description,
    String? type,
    List<TimeRange>? timeRanges,
  }) =>
      Parameter(
        id: id ?? this.id,
        description: description ?? this.description,
        type: type ?? this.type,
        timeRanges: timeRanges ?? this.timeRanges,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        description,
        type,
        timeRanges,
      ];
}
