import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/anime.dart';
import '../../../../core/providers/anime_repository_provider.dart';

// Anime Detail Provider - with parameter
final animeDetailProvider = FutureProvider.family<Anime, String>((ref, animeId) async {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.getAnimeDetail(animeId);
});

// Anime Episodes Provider - with parameter
final animeEpisodesProvider = FutureProvider.family<List<Episode>, String>((ref, animeId) async {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.getAnimeEpisodes(animeId);
});
