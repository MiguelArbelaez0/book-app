import 'package:book_app/data/models/document_model.dart';

import '../../data/repository_impl/get_favorite_book_impl.dart';
import '../repository/get_favorite_book.dart';

class GetBookFavoriteUseCase {
  final GetFavoriteBookRepository _getFavoriteBookRepository;

  GetBookFavoriteUseCase({GetFavoriteBookRepository? getFavoriteBookRepository})
      : _getFavoriteBookRepository =
            getFavoriteBookRepository ?? GetFavoriteBookRepositoyImpl();

  Future<List<Document>> invokeGetFavoriteBook() async {
    return await _getFavoriteBookRepository.onGetFavoriteBook();
  }
}
