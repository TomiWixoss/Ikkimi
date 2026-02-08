// Domain Model - Clean Architecture
class Anime {
  final String id;
  final String title;
  final String imageUrl;
  final String? description;
  final double? rating;
  final String? status;
  final int? totalEpisodes;
  final List<String> genres;
  final int? releaseYear;

  const Anime({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.description,
    this.rating,
    this.status,
    this.totalEpisodes,
    this.genres = const [],
    this.releaseYear,
  });

  Anime copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? description,
    double? rating,
    String? status,
    int? totalEpisodes,
    List<String>? genres,
    int? releaseYear,
  }) {
    return Anime(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      status: status ?? this.status,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
      genres: genres ?? this.genres,
      releaseYear: releaseYear ?? this.releaseYear,
    );
  }
}

class Episode {
  final String id;
  final String animeId;
  final int number;
  final String title;
  final String? thumbnail;
  final String? url;

  const Episode({
    required this.id,
    required this.animeId,
    required this.number,
    required this.title,
    this.thumbnail,
    this.url,
  });
}
