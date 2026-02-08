import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/search_controller.dart' as search;

class SearchView extends GetView<search.SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search anime...',
            border: InputBorder.none,
          ),
          onChanged: controller.search,
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.close_circle),
            onPressed: controller.clearSearch,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isSearching.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (controller.searchResults.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.search_normal, size: 64.sp, color: Colors.grey),
                SizedBox(height: 16.h),
                Text(
                  'Search for anime',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                ),
              ],
            ),
          );
        }
        
        return GridView.builder(
          padding: EdgeInsets.all(16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            final anime = controller.searchResults[index];
            return GestureDetector(
              onTap: () => Get.toNamed('/anime-detail', arguments: {'id': anime['id']}),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: anime['image'],
                      height: 140.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    anime['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
