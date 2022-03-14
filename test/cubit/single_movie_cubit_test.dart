import 'package:bloc_test/bloc_test.dart';
import 'package:etiya_flutter_assignment/controller/cubit/single_movie_cubit.dart';
import 'package:etiya_flutter_assignment/controller/network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Single Movie Cubit", () {
    NetworkService networkService = NetworkService();
    SingleMovieCubit singleMovieCubit =
        SingleMovieCubit(networkService: networkService);

    blocTest(
      "Single Movie Cubit Test with given movie id : 634649 should emit SingleMovieLoaded state",
      build: () => singleMovieCubit,
      act: (SingleMovieCubit cubit) => cubit.getSingleMovie("634649"),
      expect: () => [isA<SingleMovieLoaded>()],
    );
    blocTest(
      "Single Movie Cubit Test with given movie id : 634644546 that mean's wrong id should throw Error and should emit SingleMovieFailed state",
      build: () => singleMovieCubit,
      act: (SingleMovieCubit cubit) => cubit.getSingleMovie("634644546"),
      expect: () => [isA<SingleMovieFailed>()],
    );
  });
}
