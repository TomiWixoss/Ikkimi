import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          _buildHomeTab(),
          _buildLibraryTab(),
          _buildHistoryTab(),
          _buildSettingsTab(),
        ],
      )),
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: controller.changeTab,
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            selectedIcon: Icon(Iconsax.home_15),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.book),
            selectedIcon: Icon(Iconsax.book_15),
            label: 'Library',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.clock),
            selectedIcon: Icon(Iconsax.clock_15),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.setting_2),
            selectedIcon: Icon(Iconsax.setting_25),
            label: 'Settings',
          ),
        ],
      )),
    );
  }

  Widget _buildHomeTab() {
    return EasyRefresh(
      onRefresh: () async {
        controller.onRefresh();
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
                onPressed: controller.navigateToSearch,
              ),
            ],
          ),
          Obx(() => Skeletonizer(
            enabled: controller.isLoading.value,
            child: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection('Trending Now', controller.trendingAnime),
                  SizedBox(height: 16.h),
                  _buildSection('Recent Updates', controller.recentAnime),
                  SizedBox(height: 16.h),
                  _buildSection('Popular', controller.popularAnime),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildSection(String title, RxList<Map<String, dynamic>> items) {
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final anime = items[index];
              return _buildAnimeCard(anime);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAnimeCard(Map<String, dynamic> anime) {
    return GestureDetector(
      onTap: () => controller.navigateToAnimeDetail(anime['id']),
      child: Container(
        width: 120.w,
        margin: EdgeInsets.only(right: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: anime['image'],
                height: 160.h,
                width: 120.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              anime['title'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLibraryTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.book, size: 64.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            'Library',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            'Your saved anime will appear here',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.clock, size: 64.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            'History',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            'Your watch history will appear here',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.setting_2, size: 64.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            'Settings',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            'App settings and preferences',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
