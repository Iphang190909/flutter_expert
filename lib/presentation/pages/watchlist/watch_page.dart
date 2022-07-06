import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/presentation/blocs/film/film_bloc.dart';
import 'package:moviex/presentation/pages/detail/detail_page.dart';
import 'package:moviex/presentation/widgets/list_film.dart';
import 'package:moviex/presentation/widgets/list_error.dart';
import 'package:moviex/utils/enum.dart';
import 'package:skeletons/skeletons.dart';

class WatchlistPage extends StatelessWidget {
  final FilmType filmType;
  const WatchlistPage({Key? key, required this.filmType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$filmType - Watchlist'),
      ),
      body: BlocBuilder<FilmBloc, FilmState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<FilmBloc>().add(GetWatchListEvent(type: filmType));
            },
            child: state.watchListFilmViewState.maybeWhen(
              loading: () => _buildLoading(context),
              success: () => _buildSuccess(context, state.watchListFilm),
              error: () => const Center(child: Text('error')),
              orElse: () => const SizedBox(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SkeletonListView(),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Film> films) {
    if (films.isEmpty) {
      return const ListError(message: 'Empty');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListFilm(
        films: films,
        onTap: (id) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(type: filmType, id: id),
            ),
          );
        },
      ),
    );
  }
}
