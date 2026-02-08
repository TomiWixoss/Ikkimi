import 'package:get/get.dart';

class WatchController extends GetxController {
  final isLoading = true.obs;
  final videoUrl = ''.obs;
  
  int animeId = 0;
  int episodeNumber = 0;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    animeId = args?['animeId'] ?? 0;
    episodeNumber = args?['episode'] ?? 1;
    loadVideo();
  }

  void loadVideo() async {
    isLoading.value = true;
    
    // TODO: Scrape video URL from source
    await Future.delayed(const Duration(seconds: 2));
    
    // Placeholder video URL (will be replaced with actual scraping)
    videoUrl.value = 'https://example.com/anime/$animeId/episode/$episodeNumber';
    
    isLoading.value = false;
  }

  void nextEpisode() {
    episodeNumber++;
    loadVideo();
  }

  void previousEpisode() {
    if (episodeNumber > 1) {
      episodeNumber--;
      loadVideo();
    }
  }
}
