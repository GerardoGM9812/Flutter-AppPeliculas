import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Card de peliculas
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //Listado Horizontal de peliculas
            MovieSlider(
              movies: moviesProvider.popularMoviesResponse,
              titulo: 'Populares',
              onNextPage: () => moviesProvider.getOnDisplayMoviesPopular(),
            ),
          ],
        ),
      ),
    );
  }
}
