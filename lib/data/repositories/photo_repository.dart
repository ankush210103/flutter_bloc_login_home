import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo_model.dart';

class PhotoRepository {
  Future<List<PhotoModel>> fetchPhotos() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=1&limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => PhotoModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load photos");
    }
  }
}
