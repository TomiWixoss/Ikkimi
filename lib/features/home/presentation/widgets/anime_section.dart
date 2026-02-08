import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/models/anime.dart';
import 'anime_card.dart';

class AnimeSection extends ConsumerWidget {
  final String title;
  final FutureProvider<List<Anime>> provider;

  const AnimeSection({
    super.key,
    required this.title,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeAsync = ref.watch(provider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 200.h,
          child: animeAsync.when(
            data: (animeList) => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: animeList.length,
              itemBuilder: (context, index) {
                final anime = animeList[index];
                return AnimeCard(
                  anime: anime,
                  onTap: () => context.push('/anime/${anime.id}'),
                );
              },
            ),
            loading: () => Skeletonizer(
              enabled: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return AnimeCard(
                    anime: Anime(
                      id: 'skeleton_$index',
                      title: 'Loading Anime Title',
                      imageUrl: 'https://via.placeholder.com/300x400',
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
            error: (error, stack) => Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48),
                    SizedBox(height: 8.h),
                    Text('Error: $error'),
                    SizedBox(height: 8.h),
                    ElevatedButton(
                      onPressed: () => ref.invalidate(provider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
