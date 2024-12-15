class Movie {
  final String title;
  final String? image;
  final String genre;
  final double imdbRating;
  final String summary;
  final String cast;
  final String languages;
  final String country;
  final int year;
  final int? numberOfSeasons;
  final int? numberOfEpisodes;

  Movie({
    required this.title,
    this.image,
    required this.genre,
    required this.imdbRating,
    required this.summary,
    required this.cast,
    required this.languages,
    required this.country,
    required this.year,
    this.numberOfSeasons,
    this.numberOfEpisodes,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    bool isSeries = json.containsKey('seasons');

    return Movie(
      title: json['name'] ?? 'No Title',
      image: json['image']?['medium'],
      genre: json['genres']?.join(', ') ?? 'Unavailable',
      imdbRating: (json['rating']?['average'] != null)
          ? (json['rating']?['average'] as num).toDouble()
          : 4.9,
      summary: (json['summary'] ?? 'No Summary Available')
          .replaceAll(RegExp(r'<[^>]*>'), ''),
      cast: json['cast']?.map((actor) => actor['name']).join(', ') ??
          'Cast Information not Available',
      languages: json['language'] ?? 'Unknown',
      country: json['network']?['country']?['name'] ?? 'Unknown',
      year: json['premiered'] != null
          ? int.tryParse(json['premiered'].substring(0, 4)) ?? 0
          : 2003,
      numberOfSeasons: isSeries ? json['seasons']?.length ?? 0 : null,
      numberOfEpisodes: isSeries ? json['episodes']?.length ?? 0 : null,
    );
  }
}
