import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/presentation/pages/detail/detail_page.dart';
import 'package:moviex/presentation/pages/list/list_page.dart';
import 'package:moviex/presentation/widgets/card_carousel.dart';
import 'package:moviex/presentation/widgets/card_error.dart';
import 'package:moviex/presentation/widgets/card_skeleton.dart';
import 'package:moviex/utils/enum.dart';

import '../../../blocs/film/film_bloc.dart';

class TVFilmTab extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final FilmType type;

  const TVFilmTab({
    Key? key,
    required this.onRefresh,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: BlocBuilder<FilmBloc, FilmState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      _buildLabel(
                        context,
                        'Now Playing',
                        state.nowPlayingTvFilm,
                      ),
                      const SizedBox(height: 16),
                      state.nowPlayingTvFilmViewState.maybeWhen(
                        orElse: () =>
                            const Center(child: Text('Unexpected Error')),
                        loading: () => const CardSkeleton(),
                        success: () =>
                            _buildSuccess(context, state.nowPlayingTvFilm),
                        error: () =>
                            const CardError(message: 'Something Went Wrong'),
                      ),
                      const SizedBox(height: 16),
                      _buildLabel(
                        context,
                        'Popular',
                        state.popularTvFilm,
                      ),
                      const SizedBox(height: 16),
                      state.popularTvFilmViewState.maybeWhen(
                        orElse: () =>
                            const Center(child: Text('Unexpected Error')),
                        loading: () => const CardSkeleton(),
                        success: () =>
                            _buildSuccess(context, state.popularTvFilm),
                        error: () =>
                            const CardError(message: 'Something Went Wrong'),
                      ),
                      const SizedBox(height: 16),
                      _buildLabel(
                        context,
                        'Top Rated',
                        state.topTvFilm,
                      ),
                      const SizedBox(height: 16),
                      state.topTvFilmViewState.maybeWhen(
                        orElse: () =>
                            const Center(child: Text('Unexpected Error')),
                        loading: () => const CardSkeleton(),
                        success: () => _buildSuccess(context, state.topTvFilm),
                        error: () =>
                            const CardError(message: 'Something Went Wrong'),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Film> films) {
    return CardCarousel(
      films: films,
      onTap: (id) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(type: type, id: id),
          ),
        );
      },
    );
  }

  Widget _buildLabel(
    BuildContext context,
    String sectionType,
    List<Film> films,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          context.read<FilmBloc>().add(GoToListPageEvent(
                filmType: type,
                filmSectionType: sectionType,
                films: films,
              ));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ListPage(),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sectionType),
            Row(
              children: [
                Text(
                  'View all',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
