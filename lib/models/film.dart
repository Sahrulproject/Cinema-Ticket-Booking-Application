class Film {
  final String judul;
  final String genre;
  final int durasi;

  Film({
    required this.judul,
    required this.genre,
    required this.durasi,
  });

  // Optional: Add toMap() method if needed for API calls
  Map<String, dynamic> toMap() {
    return {
      'judul': judul,
      'genre': genre,
      'durasi': durasi,
    };
  }
}
