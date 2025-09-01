import 'package:flutter/material.dart';
import 'package:tixclick/models/film_model.dart';
import 'package:tixclick/services/film_service.dart';

class ListFilmScreen extends StatefulWidget {
  const ListFilmScreen({super.key});

  @override
  State<ListFilmScreen> createState() => _ListFilmScreenState();
}

class _ListFilmScreenState extends State<ListFilmScreen> {
  final FilmService _filmService = FilmService();
  late Future<List<Film>> _listFilm;

  @override
  void initState() {
    super.initState();
    _listFilm = _filmService.getListFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Film",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Film>>(
        future: _listFilm,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada film tersedia"));
          }

          final films = snapshot.data!;

          return ListView.builder(
            itemCount: films.length,
            itemBuilder: (context, index) {
              final film = films[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange.shade200,
                    child: Text(
                      film.judul[0].toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    film.judul,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${film.genre} | Durasi: ${film.durasi} menit",
                  ),
                  onTap: () {
                    // TODO: Arahkan ke halaman detail film
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          // TODO: Arahkan ke form tambah film
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
