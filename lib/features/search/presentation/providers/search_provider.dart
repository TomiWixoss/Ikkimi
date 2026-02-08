import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/anime.dart';
import '../../../../core/providers/anime_repository_provider.dart';

// Search Query Provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Search Results Provider - depends on search query
final searchResultsProvider = FutureProvider<List<Anime>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  
  if (query.isEmpty) {
    return [];
  }
  
  // Debounce: wait a bit before searching
  await Future.delayed(const Duration(milliseconds: 500));
  
  // Check if query changed during delay
  if (query != ref.read(searchQueryProvider)) {
    return [];
  }
  
  final repository = ref.watch(animeRepositoryProvider);
  return repository.searchAnime(query);
});
