import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmovies/data/models/movie.dart';
import 'package:cmovies/ui/widgets/movie_card.dart';
import 'package:cmovies/ui/viewmodels/search_cubit.dart';
import 'package:cmovies/ui/viewmodels/search_state.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                context.read<SearchCubit>().searchMovies(query);
              },
              onSubmitted: (query) {
                context.read<SearchCubit>().searchMovies(query);
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2/3.5
                      ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return MovieCard(movie: state.movies[index]);
                      },
                    );
                  } else if (state is SearchEmpty) {
                    return Center(child: Text('No movies found.'));
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text('Search for movies'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
