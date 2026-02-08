import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../providers/anime_detail_provider.dart';

class AnimeDetailPage extends ConsumerWidget {
  final String animeId;

  const AnimeDetailPage({
    super.key,
    required this.animeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeAsync = ref.watch(animeDetailProvider(animeId));
    final episodesAsync = ref.watch(animeEpisodesProvider(animeId));

    return Scaffold(
      body: animeAsync.when(
        data: (anime) => CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.h,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: anime.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.title,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        const Icon(Iconsax.star1, color: Colors.amber, size: 20),
                        SizedBox(width: 4.w),
                        Text(
                          anime.rating?.toStringAsFixed(1) ?? 'N/A',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          anime.status ?? 'Unknown',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          '${anime.totalEpisodes ?? '?'} Episodes',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 8.w,
                      children: anime.genres
                          .map((genre) => Chip(label: Text(genre)))
                          .toList(),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      anime.description ?? 'No description available.',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Episodes',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
            episodesAsync.when(
              data: (episodes) => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final episode = episodes[index];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: CachedNetworkImage(
                          imageUrl: episode.thumbnail ?? '',
                          width: 80.w,
                          height: 45.h,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Container(
                            width: 80.w,
                            height: 45.h,
                            color: Colors.grey[300],
                            child: const Icon(Icons.play_circle_outline),
                          ),
                        ),
                      ),
                      title: Text(episode.title),
                      subtitle: Text('Episode ${episode.number}'),
                      trailing: const Icon(Iconsax.play),
                      onTap: () => context.push('/watch/$animeId/${episode.number}'),
                    );
                  },
                  childCount: episodes.length,
                ),
              ),
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stack) => SliverToBoxAdapter(
                child: Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
