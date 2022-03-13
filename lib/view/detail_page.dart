import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:etiya_flutter_assignment/controller/cubit/single_movie_cubit.dart';
import 'package:etiya_flutter_assignment/controller/network.dart';
import 'package:etiya_flutter_assignment/data/constants.dart';
import 'package:etiya_flutter_assignment/view/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({@PathParam('movieID') required this.movieID, Key? key})
      : super(key: key);
  final String movieID;

//   @override
//   State<MovieDetailPage> createState() => _MovieDetailPageState();
// }

// class _MovieDetailPageState extends State<MovieDetailPage> {
  // @override
  // void initState() {
  // context.read<SingleMovieCubit>().getSingleMovie(widget.movieID);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final NetworkService networkService = NetworkService();
    return BlocProvider(
        create: ((context) => SingleMovieCubit(networkService: networkService)),
        child: BlocBuilder<SingleMovieCubit, SingleMovieState>(
          builder: (context, state) {
            if (state is SingleMovieLoading) {
              context.read<SingleMovieCubit>().getSingleMovie(movieID);
              return const Scaffold(
                body: Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            } else if (state is SingleMovieLoaded) {
              return Scaffold(
                body: CustomScrollView(
                    // appBar: AppBar(
                    //   title: Text(state.data.originalTitle),
                    //   centerTitle: true,
                    // ),
                    slivers: [
                      SliverAppBar(
                        expandedHeight: size.height * .25,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            state.data.originalTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // titlePadding: EdgeInsets.symmetric(
                          //   // vertical: 25,
                          //   horizontal: 25,
                          // ),
                          background: CachedNetworkImage(
                            imageUrl: itemPosterUrl(state.data.backdropPath!),
                          ),
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          expandedTitleScale: 1,
                        ),
                        // actions: <Widget>[
                        //   IconButton(
                        //       icon: const Icon(Icons.add_circle),
                        //       tooltip: 'Add new entry',
                        //       onPressed: () {/* ... */})
                        // ],
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Column(
                          children: [
                            Container(
                              color: Colors.red,
                              child: Column(children: [
                                state.data.originalLanguage != "en"
                                    ? Text(state.data.originalTitle)
                                    : Container(),
                                Text(state.data.title),
                              ]),
                            ),
                            Container(
                              padding: const EdgeInsets.all(spaceSM),
                              child: Text(
                                state.data.overview!,
                                // style: GoogleFonts()
                              ),
                            ),
                          ],
                        )
                      ]))
                    ]),
              );
            } else {
              return const InfoWidget(Icons.error, "An error ");
            }
          },
        ));

    // BlocBuilder<SingleMovieCubit, SingleMovieState>(
    //   builder: (context, state) {
    //     if (state is SingleMovieLoading) {
    //       // context.read<SingleMovieCubit>().getSingleMovie(movieID);
    //       return Container();
    //     }
    //     if (state is SingleMovieLoaded) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(
    //               movieID,
    //               style: const TextStyle(
    //                 color: Colors.red,
    //               ),
    //             ),
    //             Text(state.data.title),
    //           ],
    //         ),
    //       );
    //     } else {
    //       return Container();
    //     }
    //   },
    // ),
  }
}
