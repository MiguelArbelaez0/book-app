import 'dart:convert';

import 'package:book_app/data/models/search_result_model.dart';
import 'package:http/http.dart' as http;

class SearchBookDataSource {
  Future<SearchResulthModel> getBookResult(String query) async {
    const baseUrl = "http://openlibrary.org/";
    const endpoint = "search.json";

    final url = Uri.parse("$baseUrl$endpoint?q=$query");

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return responseJson.map((e) => SearchResulthModel.fromMap(e));
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
