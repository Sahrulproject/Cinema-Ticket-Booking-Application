import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tixclick/models/film_model.dart';

class ApiService {
  static const String baseUrl =
      'https://appbioskop.mobileprojp.com/api'; // Ganti dengan base URL Anda

  // POST Tambah Film
  static Future<FilmResponse> addFilm(
    Map<String, dynamic> filmData,
    String token,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/films'), // Sesuaikan endpoint
      headers: getHeaders(token),
      body: json.encode(filmData),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return FilmResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add film: ${response.statusCode}');
    }
  }

  // GET List Film
  static Future<List<Film>> getListFilm(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/films'), // Sesuaikan endpoint
      headers: getHeaders(token),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get films: ${response.statusCode}');
    }
  }

  // Headers
  static Map<String, String> getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
