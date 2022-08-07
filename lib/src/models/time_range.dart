part of 'models.dart';

class TimeRange extends Equatable {
  final String type;
  final String dateTime;
  final List<Value> value;

  const TimeRange({
    required this.type,
    required this.dateTime,
    required this.value,
  });

  factory TimeRange.fromXML(XmlElement xmlElement) {
    final attributes = xmlElement.attributes;
    final values = xmlElement.findElements('value');
    return TimeRange(
      type: attributes.value('type')!,
      dateTime: attributes.value('datetime')!,
      value: List.generate(
        values.length,
        (index) => Value.fromXML(values.elementAt(index)),
      ),
    );
  }

  TimeRange copyWith({
    String? type,
    String? dateTime,
    List<Value>? value,
  }) =>
      TimeRange(
        type: type ?? this.type,
        dateTime: dateTime ?? this.dateTime,
        value: value ?? this.value,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        type,
        dateTime,
        value,
      ];
}
