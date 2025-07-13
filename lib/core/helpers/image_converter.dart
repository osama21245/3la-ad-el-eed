import 'dart:convert';
import 'dart:io';

Future<String> convertImageToBase64(File file) async {
  final bytes = await file.readAsBytes();
  return base64Encode(bytes);
}