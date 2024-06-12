import 'package:cmovies/ui/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmovies/data/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      hoverColor: const Color.fromARGB(255, 197, 197, 197).withOpacity(0.5),
      onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: movie),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
