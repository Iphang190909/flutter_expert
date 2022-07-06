import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviex/di/inject.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/presentation/blocs/film/film_bloc.dart';
import 'package:moviex/presentation/widgets/card_carousel.dart';
import 'package:moviex/presentation/widgets/card_error.dart';
import 'package:moviex/presentation/widgets/card_skeleton.dart';
import 'package:moviex/utils/anayltics.dart';
import 'package:moviex/utils/constant.dart';
import 'package:moviex/utils/enum.dart';
import 'package:skeletons/skeletons.dart';

class DetailPage extends StatefulWidget {
  final FilmType type;
  final int id;
  const DetailPage({
    Key? key,
    required this.type,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<FilmBloc>()
      ..add(GetDetailEvent(type: widget.type, id: widget.id))
      ..add(GetRecommendationsEvent(type: widget.type, id: widget.id));
    inject<Anayltics>().goToDetailEvent(
      widget.type.toString(),
      widget.id.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async {
      context
          .read<FilmBloc>()
          .add(GetDetailEvent(type: widget.type, id: widget.id));
    }, child: BlocBuilder<FilmBloc, FilmState>(
      builder: (context, state) {
        return state.detailFilmViewState.maybeWhen(
          loading: () => _buildLoading(context),
          success: () => _buildSuccess(context, state.detailFilm),
          error: () => _buildError(context, 'Error'),
          orElse: () => _buildLoading(context),
        );
      },
    ));
  }

  Widget _buildLoading(BuildContext context) {
    return ListView(
      children: [
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            height: MediaQuery.of(context).size.height * .65,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        SkeletonParagraph(),
        SkeletonParagraph(),
        SkeletonParagraph(),
        SkeletonParagraph(),
        SkeletonParagraph(),
      ],
    );
  }

  String _getImagePath(String path) {
    if (path.isNotEmpty) {
      return '$largeImageUrl$path';
    }
    return 'https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/original/commons/certificate_logo.png';
  }

  Widget _buildSuccess(BuildContext context, Film data) {
    return Container(
      color: Theme.of(context).colorScheme.background.withOpacity(.9),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              _getImagePath(data.posterPath),
              fit: data.posterPath.isNotEmpty ? BoxFit.cover : BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              loadingBuilder: (ctx, child, loading) {
                if (loading == null) return child;
                return SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              },
              errorBuilder: (_, __, ___) {
                return const SizedBox();
              },
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .65,
                ),
                BlocBuilder<FilmBloc, FilmState>(
                  builder: (context, state) {
                    context
                        .read<FilmBloc>()
                        .add(WatchlistCheckEvent(thisFilm: state.detailFilm));
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Container(
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.9),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 5,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                data.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (!state.isExistedInWatchlist) {
                                    context.read<FilmBloc>().add(
                                          AddToWatchListEvent(
                                            type: widget.type,
                                            film: state.detailFilm,
                                          ),
                                        );
                                  } else {
                                    context.read<FilmBloc>().add(
                                          RemoveFilmFromWatchListEvent(
                                            type: widget.type,
                                            id: state.detailFilm.id,
                                          ),
                                        );
                                  }

                                  context.read<FilmBloc>()
                                    ..add(GetWatchListEvent(type: widget.type))
                                    ..add(WatchlistCheckEvent(
                                        thisFilm: state.detailFilm));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          state.isExistedInWatchlist
                                              ? Icons.check
                                              : Icons.add,
                                          color: state.isExistedInWatchlist
                                              ? Colors.green
                                              : Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          state.isExistedInWatchlist
                                              ? 'Added to watchlist'
                                              : 'Add to watchlist',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              _buildRating(context, data.voteAverage),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text('Overview'),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(data.overview == ''
                                  ? '(No overview)'
                                  : data.overview),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text('Recommendation'),
                              const SizedBox(
                                height: 16,
                              ),
                              state.recommendationFilmViewState.maybeWhen(
                                success: () => CardCarousel(
                                  films: state.recommendationFilm,
                                  onTap: (id) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            type: widget.type, id: id),
                                      ),
                                    );
                                  },
                                ),
                                error: () => const CardError(
                                    message: 'Something Went Wrong'),
                                orElse: () => const CardSkeleton(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _buildRating(BuildContext context, double rating) {
    return Row(
      children: [
        ...List.generate(5, (i) => i + 1)
            .map((i) => Icon(
                  i <= (rating / 2).round() ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 14,
                ))
            .toList(),
        const SizedBox(width: 4),
        Text(
          '$rating',
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
