import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  
  // Placeholder data
  final trendingAnime = <Map<String, dynamic>>[].obs;
  final recentAnime = <Map<String, dynamic>>[].obs;
  final popularAnime = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    isLoading.value = true;
    
    // TODO: Implement actual data loading from API
    await Future.delayed(const Duration(seconds: 2));
    
    // Placeholder data
    trendingAnime.value = List.generate(
      10,
      (index) => {
        'id': index,
        'title': 'Anime Title $index',
        'image': 'https://via.placeholder.com/300x400',
        'rating': '8.${index}',
        'episodes': '${index + 1}/12',
      },
    );
    
    recentAnime.value = List.generate(
      10,
      (index) => {
        'id': index + 10,
        'title': 'Recent Anime $index',
        'image': 'https://via.placeholder.com/300x400',
        'episode': 'Episode ${index + 1}',
      },
    );
    
    popularAnime.value = List.generate(
      10,
      (index) => {
        'id': index + 20,
        'title': 'Popular Anime $index',
        'image': 'https://via.placeholder.com/300x400',
        'views': '${(index + 1) * 1000}K',
      },
    );
    
    isLoading.value = false;
  }

  void onRefresh() {
    loadData();
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void navigateToAnimeDetail(int animeId) {
    Get.toNamed('/anime-detail', arguments: {'id': animeId});
  }

  void navigateToSearch() {
    Get.toNamed('/search');
  }
}
