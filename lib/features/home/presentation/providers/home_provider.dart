import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/anime.dart';
import '../../../../core/providers/anime_repository_provider.dart';

// Trending Anime Provider
final trendingAnimeProvider = FutureProvider<List<Anime>>((ref) async {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.getTrendingAnime();
});

// Recent Anime Provider
final recentAnimeProvider = FutureProvider<List<Anime>>((ref) async {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.getRecentAnime();
});

// Popular Anime Provider
final popularAnimeProvider = FutureProvider<List<Anime>>((ref) async {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.getPopularAnime();
});

// Bottom Navigation Index Provider
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
