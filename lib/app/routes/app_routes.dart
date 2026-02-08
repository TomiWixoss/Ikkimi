part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ANIME_DETAIL = _Paths.ANIME_DETAIL;
  static const WATCH = _Paths.WATCH;
  static const SEARCH = _Paths.SEARCH;
  static const LIBRARY = _Paths.LIBRARY;
  static const HISTORY = _Paths.HISTORY;
  static const SETTINGS = _Paths.SETTINGS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ANIME_DETAIL = '/anime-detail';
  static const WATCH = '/watch';
  static const SEARCH = '/search';
  static const LIBRARY = '/library';
  static const HISTORY = '/history';
  static const SETTINGS = '/settings';
}
