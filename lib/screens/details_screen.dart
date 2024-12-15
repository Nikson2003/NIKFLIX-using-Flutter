import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie image with box shadow and border radius
            Center(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    movie.image ?? 'https://via.placeholder.com/300',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // IMDB rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  Text(movie.imdbRating.toString(),
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            // Summary
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Summary: ${movie.summary}'),
            ),
            // Genre
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Genre: ${movie.genre}'),
            ),
            // Cast
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Cast: ${movie.cast}'),
            ),
            // Year, Country, Languages
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Year: ${movie.year}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Country: ${movie.country}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Languages: ${movie.languages}'),
            ),
            // Web Series Specific Info: Seasons and Episodes
            if (movie.numberOfSeasons != null &&
                movie.numberOfEpisodes != null) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Seasons: ${movie.numberOfSeasons}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Episodes: ${movie.numberOfEpisodes}'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
