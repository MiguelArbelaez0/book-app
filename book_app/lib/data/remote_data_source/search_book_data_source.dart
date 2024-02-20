import 'dart:convert';

import 'package:book_app/data/models/search_result_model.dart';
import 'package:http/http.dart' as http;

class SearchBookDataSource {
  Future<SearchResulthModel> getBookResult(String query) async {
    const baseUrl = "http://openlibrary.org/";
    const endpoint = "search.json";

    final uri = Uri.parse("$baseUrl$endpoint?q=$query");

    final response = await http.get(uri);

    return SearchResulthModel.fromJson(json.decode(response.body));
  }
}
