import 'package:book_app/data/models/search_result_model.dart';

abstract class SearchBookRepository {
  Future<SearchResult> onGetBook(String query);
}
