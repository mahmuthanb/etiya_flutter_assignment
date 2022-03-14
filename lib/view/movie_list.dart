import 'package:etiya_flutter_assignment/controller/cubit/movie_cubit.dart';
import 'package:etiya_flutter_assignment/data/constants.dart';
import 'package:etiya_flutter_assignment/model/movie_model.dart';
import 'package:etiya_flutter_assignment/view/widgets/info_widget.dart';
import 'package:etiya_flutter_assignment/view/widgets/movie_card/movie_card_placeholder.dart';
import 'package:etiya_flutter_assignment/view/widgets/movie_card/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList extends StatefulWidget {
  const MovieList({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late List<MovieModel> fetchedMovies = [];
    return BlocConsumer<MovieCubit, MovieState>(
      listenWhen: (previous, current) {
        return current is MovieLoaded;
      },
      listener: (context, state) {
        if (state is MovieLoaded) {
          _textEditingController.addListener(() {
            fetchedMovies = state.movies
                .where((element) =>
                    element.title.contains(_textEditingController.text))
                .toList();
          });
        }
      },
      builder: (context, state) {
        final Size size = MediaQuery.of(context).size;
        if (state is MovieLoaded && state.movies.isNotEmpty) {
          fetchedMovies = state.movies;
          final double exactWidht = size.width * .90;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                flexibleSpace: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(spaceXS),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.white,
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "type to filter",
                      ),
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              body: Container(
                color: etiyaCorporateMain.withAlpha(200),
                child: fetchedMovies.isNotEmpty
                    ? ListView.builder(
                        itemCount: fetchedMovies.length,
                        itemBuilder: ((context, index) {
                          return MovieCard(
                              fetchedMovies[index], index, exactWidht);
                        }),
                      )
                    : const InfoWidget(Icons.warning, "no matches"),
              ),
            ),
          );
          // return const MovieCardLoadingWidget();
        } else {
          return const MovieCardLoadingWidget();
        }
      },
    );
  }
}
