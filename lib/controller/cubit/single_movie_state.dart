part of 'single_movie_cubit.dart';

@immutable
abstract class SingleMovieState {}

class SingleMovieLoading extends SingleMovieState {}

class SingleMovieLoaded extends SingleMovieState {
  final SingleMovieModel data;
  SingleMovieLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingleMovieLoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class SingleMovieFailed extends SingleMovieState {
  final String? message;
  SingleMovieFailed({this.message});
}
