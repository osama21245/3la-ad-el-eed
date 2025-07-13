class TripInfoModel {
  final String distanceText;
  final int distanceValue;
  final String durationText;
  final int durationValue;

  TripInfoModel({
    required this.distanceText,
    required this.distanceValue,
    required this.durationText,
    required this.durationValue,
  });

  factory TripInfoModel.fromJson(Map<String, dynamic> json) {
    final element = json['rows'][0]['elements'][0];
    final distance = element['distance'];
    final duration = element['duration'];

    return TripInfoModel(
      distanceText: distance['text'],
      distanceValue: distance['value'],
      durationText: duration['text'],
      durationValue: duration['value'],
    );
  }
}