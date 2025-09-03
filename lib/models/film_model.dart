class Film {
  final int id;
  final String title;
  final String description;
  final String genre;
  final String director;
  final String writer;
  final String stats;
  final String imageUrl;
  final String imagePath;

  Film({
    required this.id,
    required this.title,
    required this.description,
    required this.genre,
    required this.director,
    required this.writer,
    required this.stats,
    required this.imageUrl,
    required this.imagePath,
  });

  // Factory untuk convert dari JSON ke objek Film
  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      genre: json['genre'] ?? '',
      director: json['director'] ?? '',
      writer: json['writer'] ?? '',
      stats: json['stats'] ?? '',
      imageUrl: json['image_url'] ?? '',
      imagePath: json['image_path'] ?? '',
    );
  }

  // Convert objek Film ke JSON (dipakai saat POST Tambah Film)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'genre': genre,
      'director': director,
      'writer': writer,
      'stats': stats,
      // 'image_url' dan 'image_path' biasanya di-generate oleh server
      // jadi tidak perlu dikirim saat create
    };
  }

  // Untuk keperluan display di UI (opsional)
  String get judul => title;
  String get deskripsi => description;
  int get durasi => 0; // Jika tidak ada di response, bisa di-set default
}

// Model untuk response API
class FilmResponse {
  final String message;
  final Film data;

  FilmResponse({required this.message, required this.data});

  factory FilmResponse.fromJson(Map<String, dynamic> json) {
    return FilmResponse(
      message: json['message'] ?? '',
      data: Film.fromJson(json['data'] ?? {}),
    );
  }
}
