import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easy_refresh/easy_refresh.dart';
import '../providers/home_provider.dart';
import 'anime_section.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EasyRefresh(
      onRefresh: () async {
        // Invalidate all providers to refresh data
        ref.invalidate(trendingAnimeProvider);
        ref.invalidate(recentAnimeProvider);
        ref.invalidate(popularAnimeProvider);
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(
              'Ikkimi',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Iconsax.search_normal),
                onPressed: () => context.push('/search'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                AnimeSection(
                  title: 'Trending Now',
                  provider: trendingAnimeProvider,
                ),
                SizedBox(height: 16.h),
                AnimeSection(
                  title: 'Recent Updates',
                  provider: recentAnimeProvider,
                ),
                SizedBox(height: 16.h),
                AnimeSection(
                  title: 'Popular',
                  provider: popularAnimeProvider,
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
