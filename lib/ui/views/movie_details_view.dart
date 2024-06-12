import 'package:flutter/material.dart';
import 'package:cmovies/data/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w780${movie.backdropPath}',
                    fit: BoxFit.fill,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Release Date: ${movie.releaseDate}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      SizedBox(width: 4),
                      Text(
                        movie.vote_average.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie.overview,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
