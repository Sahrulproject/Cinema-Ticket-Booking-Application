import 'package:flutter/material.dart';
import 'package:tixclick/preference/shared_preference.dart';
import 'package:tixclick/services/api_service.dart';

class TambahFilmScreen extends StatefulWidget {
  const TambahFilmScreen({super.key});

  @override
  State<TambahFilmScreen> createState() => _TambahFilmScreenState();
}

class _TambahFilmScreenState extends State<TambahFilmScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController writerController = TextEditingController();
  final TextEditingController statsController = TextEditingController();
  bool isLoading = false;

  Future<void> _tambahFilm() async {
    setState(() => isLoading = true);

    try {
      final token =
          await PreferenceHandler.getToken(); // Dapatkan token dari shared_preferences

      final filmData = {
        'title': titleController.text,
        'description': descriptionController.text,
        'genre': genreController.text,
        'director': directorController.text,
        'writer': writerController.text,
        'stats': statsController.text,
      };

      final response = await ApiService.addFilm(filmData, token!);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.message)));

      // Clear form setelah berhasil
      titleController.clear();
      descriptionController.clear();
      genreController.clear();
      directorController.clear();
      writerController.clear();
      statsController.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Film')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: genreController,
              decoration: const InputDecoration(labelText: 'Genre'),
            ),
            TextField(
              controller: directorController,
              decoration: const InputDecoration(labelText: 'Director'),
            ),
            TextField(
              controller: writerController,
              decoration: const InputDecoration(labelText: 'Writer'),
            ),
            TextField(
              controller: statsController,
              decoration: const InputDecoration(labelText: 'Stats'),
            ),

            const SizedBox(height: 20),

            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _tambahFilm,
                    child: const Text('Tambah Film'),
                  ),
          ],
        ),
      ),
    );
  }
}
