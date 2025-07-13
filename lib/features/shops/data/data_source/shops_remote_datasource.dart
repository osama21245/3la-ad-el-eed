//example

import 'package:http/http.dart' as http;

class ShopsRemoteDataSource {
  Future<List<Map<String, dynamic>>> getShops() async {
    final response = await http.get(Uri.parse('https://api.example.com/shops'));
    return response.body as List<Map<String, dynamic>>;
  }
}
