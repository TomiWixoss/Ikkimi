import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchQuery = ''.obs;
  final isSearching = false.obs;
  final searchResults = <Map<String, dynamic>>[].obs;

  void search(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    
    searchQuery.value = query;
    isSearching.value = true;
    
    // TODO: Implement actual search
    await Future.delayed(const Duration(seconds: 1));
    
    searchResults.value = List.generate(
      10,
      (index) => {
        'id': index,
        'title': 'Search Result $index for "$query"',
        'image': 'https://via.placeholder.com/300x400',
        'rating': '8.${index}',
      },
    );
    
    isSearching.value = false;
  }

  void clearSearch() {
    searchQuery.value = '';
    searchResults.clear();
  }
}
