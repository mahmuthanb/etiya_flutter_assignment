import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:etiya_flutter_assignment/controller/network.dart';
import 'package:etiya_flutter_assignment/model/single_movie_model.dart';
import 'package:meta/meta.dart';

part 'single_movie_state.dart';

class SingleMovieCubit extends Cubit<SingleMovieState> {
  final NetworkService networkService;
  SingleMovieCubit({required this.networkService})
      : super(SingleMovieLoading());

  // getSingleMovie(id!).then((value) {
  //   emit(SingleMovieLoaded(data: value));
  // });

  getSingleMovie(String id) async {
    // late MovieModel result;
    await networkService.fetchSingleMovie(id).catchError((error, stackTrace) {
      var errorOn = jsonEncode(error);
      emit(SingleMovieFailed(message: errorOn));
    }).then((value) {
      emit(SingleMovieLoaded(data: value));
      // return value;
    });
  }
}
