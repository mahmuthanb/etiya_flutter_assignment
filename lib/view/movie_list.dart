import 'package:etiya_flutter_assignment/controller/cubit/movie_cubit.dart';
import 'package:etiya_flutter_assignment/data/constants.dart';
import 'package:etiya_flutter_assignment/view/widgets/movie_card_widget/movie_card_placeholder.dart';
import 'package:etiya_flutter_assignment/view/widgets/movie_card_widget/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(spaceXS),
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "type to filter",
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
          final Size size = MediaQuery.of(context).size;
          if (state is MovieLoaded) {
            final double exactWidht = size.width * .90;
            return Container(
              color: etiyaCorporateMain.withAlpha(200),
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return MovieCard(state.movies[index], index, exactWidht);
                }),
                itemCount: state.movies.length,
              ),
            );
            // return const MovieCardLoadingWidget();
          } else {
            return const MovieCardLoadingWidget();
          }
        }),
      ),
    );
  }
}
