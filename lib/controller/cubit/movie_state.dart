part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieModel> movies;
  MovieLoaded({required this.movies});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieLoaded && listEquals(other.movies, movies);
  }

  @override
  int get hashCode => movies.hashCode;
}

class MovieFailed extends MovieState {
  final String? message;
  MovieFailed({this.message});
}
