import 'package:cmovies/data/models/movie.dart';
import 'package:cmovies/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageSmoothIndicator extends StatelessWidget {
  const PageSmoothIndicator({
    super.key,
    required PageController pageController,
    required this.movies,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: 350,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 40, bottom: 8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                              width: 300,
                              height: 150,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                    child: Text('Image not available'));
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 8), // Add some spacing between image and text
                      Text(
                        movie.title,
                        style: AppTextStyles.titleTextStyle,
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, ),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: movies.length,
                      effect: WormEffect(
                        dotColor: Colors.white,
                        activeDotColor: Colors.blue,
                        dotHeight: 7.0,
                        dotWidth: 7.0,
                        type: WormType.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class PageSmoothIndicator extends StatelessWidget {
//   const PageSmoothIndicator({
//     super.key,
//     required PageController pageController,
//     required this.movies,
//   }) : _pageController = pageController;

//   final PageController _pageController;
//   final List<Movie> movies;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Stack(
//         children: [
//           PageView.builder(
//             controller: _pageController,
//             itemCount: movies.length,
//             itemBuilder: (context, index) {
//               final movie = movies[index];
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: AspectRatio(
//                         aspectRatio: 16 / 9,
//                         child: Image.network(
//                           'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
//                           width: 300,
//                           height: 150,
//                           fit: BoxFit.fitWidth,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Center(child: Text('Image not available'));
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                         height: 8), // Add some spacing between image and text
//                     Text(
//                       movie.title,
//                       style: AppTextStyles.titleTextStyle,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           Positioned(
//             top: 20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18.0),
//                   child: SmoothPageIndicator(
//                     controller: _pageController,
//                     count: movies.length,
//                     effect: WormEffect(
//                       dotColor: Colors.white,
//                       activeDotColor: Colors.blue,
//                       dotHeight: 5.0,
//                       dotWidth: 5.0,
//                       type: WormType.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
