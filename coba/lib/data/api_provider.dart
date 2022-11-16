import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:coba/model/popular_movie.dart';

class ApiProvider {
  String apiKey = '77d8b5386456f8a33fbbb8ed31e4f1d1';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}