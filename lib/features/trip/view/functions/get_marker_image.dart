import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

// Future<Uint8List> getMarker() async {
//   ByteData byteData = await rootBundle.load("assets/delivery.png");
//   return byteData.buffer.asUint8List();
// }
Future<Uint8List> getMarker({int width = 64, int height = 64}) async {
  final byteData = await rootBundle.load("assets/delivery.png");
  final codec = await instantiateImageCodec(
    byteData.buffer.asUint8List(),
    targetWidth: width,
    targetHeight: height,
  );
  final frame = await codec.getNextFrame();
  final resizedImage = frame.image;

  final byteDataResized = await resizedImage.toByteData(
    format: ui.ImageByteFormat.png,
  );
  return byteDataResized!.buffer.asUint8List();
}
