import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/presentation/blocs/film/film_bloc.dart';
import 'package:moviex/presentation/pages/detail/detail_page.dart';
import 'package:moviex/presentation/widgets/list_error.dart';
import 'package:moviex/presentation/widgets/list_film.dart';
import 'package:moviex/utils/enum.dart';
import 'package:skeletons/skeletons.dart';

class SearchPage extends StatefulWidget {
  final FilmType type;
  const SearchPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
            onChanged: (query) {
              context
                  .read<FilmBloc>()
                  .add(SearchFilmEvent(type: widget.type, query: query));
            },
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<FilmBloc, FilmState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: state.searchFilmViewState.maybeWhen(
                  orElse: () => _buildError(context, 'Please input Search'),
                  success: () => _buildSuccess(context, state.searchFilm),
                  error: () => _buildError(
                    context,
                    state.searchQuery.isEmpty
                        ? 'Please input Search'
                        : 'Not Found',
                  ),
                  loading: () => _buildLoading(context),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSuccess(BuildContext context, List<Film> films) {
    if (films.isEmpty) {
      return const ListError(message: 'Empty');
    }
    return ListFilm(
      films: films,
      onTap: (id) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(type: widget.type, id: id),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SkeletonListView(),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return ListError(
      message: message,
    );
  }
}
