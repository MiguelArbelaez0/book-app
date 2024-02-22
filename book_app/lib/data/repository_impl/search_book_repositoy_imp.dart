import 'package:book_app/data/models/search_result_model.dart';
import 'package:book_app/data/remote_data_source/search_book_data_source.dart';

import '../../domain/repository/search_book_repository.dart';

class SearchBookRepositoryImp extends SearchBookRepository {
  final SearchBookDataSource _searchBookDataSource;

  SearchBookRepositoryImp({SearchBookDataSource? searchBookDataSource})
      : _searchBookDataSource = searchBookDataSource ?? SearchBookDataSource();

  @override
  Future<SearchResulthModel> onGetBook(String query) async {
    return await _searchBookDataSource.getBookResult(query);
  }
}
