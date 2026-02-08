import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/home/data/repositories/anime_repository_impl.dart';
import '../../features/home/domain/repositories/anime_repository.dart';

// Repository Provider - Dependency Injection
final animeRepositoryProvider = Provider<AnimeRepository>((ref) {
  return AnimeRepositoryImpl();
});
