import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tixclick/models/film_model.dart';

class FilmService {
  static const String baseUrl =
      "https://appbioskop.mobileprojp.com/api"; // ganti dengan URL API kamu

  // GET List Film
  Future<List<Film>> getListFilm() async {
    final response = await http.get(Uri.parse("$baseUrl/film"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception("Gagal mengambil daftar film");
    }
  }

  // POST Tambah Film
  Future<Film> tambahFilm(Film film) async {
    final response = await http.post(
      Uri.parse("$baseUrl/film"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(film.toJson()),
    );

    if (response.statusCode == 201) {
      return Film.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal menambahkan film");
    }
  }
}
