class Movie {
  final int id;
  final String title;
  final String description;
  final String? imageUrl; // Tambah field untuk gambar
  final double rating;
  final int duration;
  final String genre;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl, // Tambahkan ini
    required this.rating,
    required this.duration,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'], // Sesuaikan dengan response API
      rating: json['rating']?.toDouble() ?? 0.0,
      duration: json['duration'] ?? 120,
      genre: json['genre'] ?? 'Action',
    );
  }
}
