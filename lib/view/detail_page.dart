import 'package:auto_route/auto_route.dart';
import 'package:etiya_flutter_assignment/controller/cubit/single_movie_cubit.dart';
import 'package:etiya_flutter_assignment/controller/network.dart';
import 'package:etiya_flutter_assignment/view/widgets/details_page/details_page_placeholder.dart';
import 'package:etiya_flutter_assignment/view/widgets/details_page/details_page_widgets.dart';
import 'package:etiya_flutter_assignment/view/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({@PathParam('movieID') required this.movieID, Key? key})
      : super(key: key);
  final String movieID;

  @override
  Widget build(BuildContext context) {
    final NetworkService networkService = NetworkService();
    return BlocProvider(
        create: ((context) => SingleMovieCubit(networkService: networkService)),
        child: BlocBuilder<SingleMovieCubit, SingleMovieState>(
          builder: (context, state) {
            if (state is SingleMovieLoading) {
              context.read<SingleMovieCubit>().getSingleMovie(movieID);
              return const DetailsPagePlaceholderWidget();
            } else if (state is SingleMovieLoaded) {
              return MovieDetailPageWidget(state.data);
            } else {
              return const InfoWidget(Icons.error, "An error occured");
            }
          },
        ));
  }
}
