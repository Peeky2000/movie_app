class UrlEndPoint{
  static const _MovieEndPoint movies = _MovieEndPoint();
}

class _MovieEndPoint{
  const _MovieEndPoint();

  final String _moviePath = 'movie';

  String get trendingMovie => 'trending/$_moviePath/day';
  String get popularMovie => '$_moviePath/popular';
  String get playingNowMovie => '$_moviePath/now_playing';
  String get comingSoonMovie => '$_moviePath/upcoming';
}