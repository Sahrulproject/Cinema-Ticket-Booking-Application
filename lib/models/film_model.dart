class Film {
  final int id;
  final String judul;
  final String genre;
  final int durasi; // dalam menit
  final String deskripsi;

  Film({
    required this.id,
    required this.judul,
    required this.genre,
    required this.durasi,
    required this.deskripsi,
  });

  // Factory untuk convert dari JSON ke objek Film
  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      judul: json['judul'],
      genre: json['genre'],
      durasi: json['durasi'],
      deskripsi: json['deskripsi'],
    );
  }

  // Convert objek Film ke JSON (dipakai saat POST Tambah Film)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'genre': genre,
      'durasi': durasi,
      'deskripsi': deskripsi,
    };
  }
}
