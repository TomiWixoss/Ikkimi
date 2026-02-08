import 'package:get/get.dart';

class AnimeDetailController extends GetxController {
  final isLoading = true.obs;
  final isFavorite = false.obs;
  
  final animeData = <String, dynamic>{}.obs;
  final episodes = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    final animeId = args?['id'] ?? 0;
    loadAnimeDetail(animeId);
  }

  void loadAnimeDetail(int animeId) async {
    isLoading.value = true;
    
    // TODO: Load actual anime data
    await Future.delayed(const Duration(seconds: 1));
    
    animeData.value = {
      'id': animeId,
      'title': 'Anime Title $animeId',
      'image': 'https://via.placeholder.com/300x400',
      'rating': '8.5',
      'year': '2024',
      'status': 'Ongoing',
      'genres': ['Action', 'Adventure', 'Fantasy'],
      'description': 'This is a placeholder description for the anime. '
          'The actual description will be loaded from the anime source.',
    };
    
    episodes.value = List.generate(
      12,
      (index) => {
        'number': index + 1,
        'title': 'Episode ${index + 1}',
        'thumbnail': 'https://via.placeholder.com/160x90',
        'duration': '24:00',
      },
    );
    
    isLoading.value = false;
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    // TODO: Save to database
  }

  void playEpisode(int episodeNumber) {
    Get.toNamed('/watch', arguments: {
      'animeId': animeData['id'],
      'episode': episodeNumber,
    });
  }
}
