import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../providers/home_provider.dart';
import '../widgets/home_tab.dart';
import '../../../library/presentation/pages/library_page.dart';
import '../../../history/presentation/pages/history_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    final pages = [
      const HomeTab(),
      const LibraryPage(),
      const HistoryPage(),
      const SettingsPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
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
      ),
    );
  }
}
