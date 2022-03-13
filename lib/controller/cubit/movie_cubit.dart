import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:etiya_flutter_assignment/model/movie_model.dart';
import 'package:flutter/foundation.dart';

import '../network.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final NetworkService networkService;
  MovieCubit({required this.networkService}) : super(MovieLoading()) {
    getAllMovies().then((value) {
      emit(MovieLoaded(movies: value));
    });
  }
  Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> result = [];
    result = await networkService
        .fetchMovies("/popular")
        .catchError((error, stackTrace) {
      var errorOn = jsonEncode(error);
      emit(MovieFailed(message: errorOn));
    }).then((value) {
      return value;
    });
    return result;
  }
}
