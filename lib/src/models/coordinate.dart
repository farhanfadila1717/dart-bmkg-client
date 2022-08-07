part of 'models.dart';

class Coordinate extends Equatable {
  final double lat;
  final double long;

  const Coordinate({
    required this.lat,
    required this.long,
  });

  Coordinate copyWith({
    double? lat,
    double? long,
  }) =>
      Coordinate(
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        lat,
        long,
      ];
}
