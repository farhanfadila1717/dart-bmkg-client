part of 'models.dart';

class Value extends Equatable {
  final String unit;
  final String value;

  const Value({
    required this.unit,
    required this.value,
  });

  factory Value.fromXML(XmlElement xmlElement) {
    final attributes = xmlElement.attributes;
    return Value(
      unit: attributes.value('unit')!,
      value: xmlElement.text,
    );
  }

  Value copyWith({
    String? unit,
    String? value,
  }) =>
      Value(
        unit: unit ?? this.unit,
        value: value ?? this.value,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        unit,
        value,
      ];
}
