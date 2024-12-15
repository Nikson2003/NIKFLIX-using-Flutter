import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({Key? key, required this.movie, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(8.0),
        leading: Image.network(movie.image ?? 'https://via.placeholder.com/50'),
        title: Text(movie.title),
        subtitle: Text('${movie.imdbRating} | ${movie.year}'),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
