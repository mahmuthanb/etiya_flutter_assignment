import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:etiya_flutter_assignment/model/movie_model.dart';
import 'package:http/http.dart' as http;

import '../../data/api_provider.dart';

class NetworkService {
  final Dio dio = Dio();
  final String baseUrl = 'http://api.themoviedb.org/3';
  final String movieUrl = '/movie';
  final Map<String, String> queryParameters = {
    "api_key": apiKey,
  };

  Future<List<MovieModel>> fetchImages() async {
    List<MovieModel> responseList = [];
    // final uri = Uri.https(baseUrl, '$movieUrl/popular');
    dio.options.baseUrl = baseUrl + movieUrl;
    dio.options.headers = queryParameters;
    final Response response = await dio.get('popular');
    // final response = await http.get(uri, headers: queryParameters);
    if (response.statusCode == 200) {
      var decodedResponse =
          MovieResponseModel.fromJson(jsonDecode(response.data));
      responseList = decodedResponse.results;
      // return response;
      return responseList;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
