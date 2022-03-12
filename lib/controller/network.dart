import 'package:dio/dio.dart';

import '../data/api_provider.dart';
import '../model/movie_model.dart';

class NetworkService {
  final Dio dio = Dio();
  final String baseUrl = 'http://api.themoviedb.org/3';
  final String movieUrl = '/movie';
  final Map<String, String> queryParameters = {
    "api_key": apiKey,
  };

  Future<List<MovieModel>> fetchMovies(String path) async {
    List<MovieModel> responseList = [];
    dio.options.baseUrl = baseUrl + movieUrl;
    dio.options.queryParameters = queryParameters;
    final Response response = await dio.get(path);
    if (response.statusCode == 200) {
      // Succesfull response
      var decodedResponse = MovieResponseModel.fromJson(response.data);
      responseList = decodedResponse.results;
      return responseList;
    } else {
      // If response status is not 200, that means there is a problem with request
      throw Exception(response.statusMessage);
    }
  }
}
