import 'package:cmovies/ui/viewmodels/search_cubit.dart';

import 'package:cmovies/ui/views/home_view.dart';
import 'package:cmovies/ui/views/mow_playing.dart';
import 'package:cmovies/ui/views/search_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:cmovies/services/api/tmdb_service.dart';
import 'package:cmovies/ui/viewmodels/movies_cubit.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit(TMDbService()),
        ),
        BlocProvider(
          create: (context) => SearchCubit(TMDbService()),
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            MoviesPage(),
            SearchScreen(), NowPlayingScreen()
            // Add other pages here, e.g., FavoritePage()
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              selectedColor: Colors.red,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.play_circle),
              title: Text('Now Playing'),
              selectedColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
