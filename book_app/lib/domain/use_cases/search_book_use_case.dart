import 'package:book_app/data/models/search_result_model.dart';
import 'package:book_app/domain/repository_impl/search_book_repositoy_imp.dart';

import '../repository/search_book_repository.dart';

class SeacrhBookUseCase {
  final SearchBookRepository _bookRepository;

  SeacrhBookUseCase({SearchBookRepository? searchBookRepository})
      : _bookRepository = searchBookRepository ?? SearchBookRepositoryImp();

  Future<SearchResulthModel> invokeResultBook(String query) async {
    return await _bookRepository.onGetBook(query);
  }
}
