import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviex/presentation/blocs/film/film_bloc.dart';
import 'package:moviex/presentation/pages/main/widget/movie_film_tab.dart';
import 'package:moviex/presentation/pages/main/widget/tv_film_tab.dart';
import 'package:moviex/presentation/pages/search/search_page.dart';
import 'package:moviex/presentation/pages/watchlist/watch_page.dart';
import 'package:moviex/utils/enum.dart';

class Fragment {
  final String label;
  final Icon icon;
  final FilmType type;
  final Widget screen;

  Fragment({
    required this.label,
    required this.icon,
    required this.type,
    required this.screen,
  });
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    _onRefresh(context);
    super.initState();
  }

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FilmBloc>().add(const FetchMainPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(
      builder: (context, state) {
        List<Fragment> fragments = [
          Fragment(
            label: 'Movie',
            icon: const Icon(Icons.movie),
            type: FilmType.movie,
            screen: MovieFilmTab(
              onRefresh: () async => _onRefresh(context),
              type: FilmType.movie,
            ),
          ),
          Fragment(
            label: 'TV',
            icon: const Icon(Icons.tv),
            type: FilmType.tv,
            screen: TVFilmTab(
              onRefresh: () async => _onRefresh(context),
              type: FilmType.tv,
            ),
          ),
        ];

        return Scaffold(
          appBar: AppBar(
            title: Text(fragments[state.mainPageTabIndex].label),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  context.read<FilmBloc>().add(SearchFilmEvent(
                      type: fragments[state.mainPageTabIndex].type, query: ''));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(
                          type: fragments[state.mainPageTabIndex].type),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  context.read<FilmBloc>().add(GetWatchListEvent(
                      type: fragments[state.mainPageTabIndex].type));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchlistPage(
                            filmType: fragments[state.mainPageTabIndex].type),
                      ));
                },
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.mainPageTabIndex,
            showUnselectedLabels: false,
            onTap: (index) => context.read<FilmBloc>().add(
                  ChangeMainPageTabEvent(index: index),
                ),
            items: fragments
                .map((e) =>
                    BottomNavigationBarItem(icon: e.icon, label: e.label))
                .toList(),
          ),
          body: SafeArea(child: fragments[state.mainPageTabIndex].screen),
        );
      },
    );
  }
}
