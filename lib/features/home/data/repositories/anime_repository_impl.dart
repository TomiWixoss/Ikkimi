import '../../../../core/models/anime.dart';
import '../../domain/repositories/anime_repository.dart';

// Repository Implementation - Data Layer (Clean Architecture)
class AnimeRepositoryImpl implements AnimeRepository {
  // TODO: Inject API service here
  
  @override
  Future<List<Anime>> getTrendingAnime() async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(seconds: 1));
    
    return List.generate(
      10,
      (index) => Anime(
        id: 'trending_$index',
        title: 'Trending Anime $index',
        imageUrl: 'https://via.placeholder.com/300x400',
        rating: 8.0 + (index * 0.1),
        totalEpisodes: 12 + index,
        genres: ['Action', 'Adventure'],
        status: 'Ongoing',
      ),
    );
  }

  @override
  Future<List<Anime>> getRecentAnime() async {
    await Future.delayed(const Duration(seconds: 1));
    
    return List.generate(
      10,
      (index) => Anime(
        id: 'recent_$index',
        title: 'Recent Anime $index',
        imageUrl: 'https://via.placeholder.com/300x400',
        rating: 7.5 + (index * 0.1),
        genres: ['Drama', 'Romance'],
      ),
    );
  }

  @override
  Future<List<Anime>> getPopularAnime() async {
    await Future.delayed(const Duration(seconds: 1));
    
    return List.generate(
      10,
      (index) => Anime(
        id: 'popular_$index',
        title: 'Popular Anime $index',
        imageUrl: 'https://via.placeholder.com/300x400',
        rating: 9.0 + (index * 0.05),
        genres: ['Fantasy', 'Action'],
      ),
    );
  }

  @override
  Future<Anime> getAnimeDetail(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    return Anime(
      id: id,
      title: 'Anime Detail $id',
      imageUrl: 'https://via.placeholder.com/300x400',
      description: 'This is a detailed description of the anime. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      rating: 8.5,
      status: 'Ongoing',
      totalEpisodes: 24,
      genres: ['Action', 'Adventure', 'Fantasy'],
      releaseYear: 2026,
    );
  }

  @override
  Future<List<Episode>> getAnimeEpisodes(String animeId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    return List.generate(
      24,
      (index) => Episode(
        id: 'ep_${index + 1}',
        animeId: animeId,
        number: index + 1,
        title: 'Episode ${index + 1}',
        thumbnail: 'https://via.placeholder.com/160x90',
      ),
    );
  }

  @override
  Future<List<Anime>> searchAnime(String query) async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    if (query.isEmpty) return [];
    
    return List.generate(
      5,
      (index) => Anime(
        id: 'search_$index',
        title: 'Search Result: $query $index',
        imageUrl: 'https://via.placeholder.com/300x400',
        rating: 7.0 + (index * 0.2),
        genres: ['Action'],
      ),
    );
  }
}
