import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviex/domain/entities/film.dart';
import 'package:moviex/presentation/blocs/film/film_bloc.dart';
import 'package:moviex/presentation/pages/detail/detail_page.dart';
import 'package:moviex/presentation/widgets/list_film.dart';
import 'package:moviex/presentation/widgets/list_error.dart';
import 'package:moviex/utils/enum.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    context.read<FilmBloc>().add(const FetchMainPageEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<FilmBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${state.listPageFilmType} - ${state.listPageFilmSectionType}',
        ),
      ),
      body: _buildSuccess(
        context,
        state.listPageFilm,
        state.listPageFilmType,
      ),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Film> films, FilmType type) {
    if (films.isEmpty) return const ListError(message: 'Empty');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListFilm(
        films: [...films],
        onTap: (id) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(type: type, id: id),
            ),
          );
        },
      ),
    );
  }
}
