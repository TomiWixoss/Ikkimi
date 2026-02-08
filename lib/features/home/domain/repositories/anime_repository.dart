import '../../../../core/models/anime.dart';

// Repository Interface - Domain Layer (Clean Architecture)
abstract class AnimeRepository {
  Future<List<Anime>> getTrendingAnime();
  Future<List<Anime>> getRecentAnime();
  Future<List<Anime>> getPopularAnime();
  Future<Anime> getAnimeDetail(String id);
  Future<List<Episode>> getAnimeEpisodes(String animeId);
  Future<List<Anime>> searchAnime(String query);
}
