import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/watch_controller.dart';

class WatchView extends GetView<WatchController> {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode ${controller.episodeNumber}'),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.arrow_left_2),
            onPressed: controller.previousEpisode,
          ),
          IconButton(
            icon: const Icon(Iconsax.arrow_right_3),
            onPressed: controller.nextEpisode,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return Column(
          children: [
            // Video Player (WebView)
            Container(
              height: 250.h,
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.video_play, size: 64.sp, color: Colors.white),
                    SizedBox(height: 16.h),
                    Text(
                      'Video Player Placeholder',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'WebView will load anime player here',
                      style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            // Episode info and controls
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anime Title',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Episode ${controller.episodeNumber}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    const Text(
                      'Episode description will appear here after scraping from the source.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
