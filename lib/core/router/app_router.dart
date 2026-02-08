import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/anime_detail/presentation/pages/anime_detail_page.dart';
import '../../features/watch/presentation/pages/watch_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/anime/:id',
      name: 'anime-detail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return AnimeDetailPage(animeId: id);
      },
    ),
    GoRoute(
      path: '/watch/:id/:episode',
      name: 'watch',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final episode = state.pathParameters['episode']!;
        return WatchPage(animeId: id, episode: episode);
      },
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri}'),
    ),
  ),
);
