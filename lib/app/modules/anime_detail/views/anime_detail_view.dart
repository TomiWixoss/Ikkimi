import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/anime_detail_controller.dart';

class AnimeDetailView extends GetView<AnimeDetailController> {
  const AnimeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final anime = controller.animeData;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.h,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: anime['image'],
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    controller.isFavorite.value
                        ? Iconsax.heart5
                        : Iconsax.heart,
                  ),
                  onPressed: controller.toggleFavorite,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime['title'],
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Iconsax.star5, size: 16.sp, color: Colors.amber),
                        SizedBox(width: 4.w),
                        Text(anime['rating']),
                        SizedBox(width: 16.w),
                        Text('${anime['year']} • ${anime['status']}'),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 8.w,
                      children: (anime['genres'] as List)
                          .map((genre) => Chip(label: Text(genre)))
                          .toList(),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(anime['description']),
                    SizedBox(height: 24.h),
                    Text(
                      'Episodes',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final episode = controller.episodes[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: CachedNetworkImage(
                        imageUrl: episode['thumbnail'],
                        width: 80.w,
                        height: 45.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(episode['title']),
                    subtitle: Text(episode['duration']),
                    trailing: const Icon(Iconsax.play),
                    onTap: () => controller.playEpisode(episode['number']),
                  );
                },
                childCount: controller.episodes.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}
