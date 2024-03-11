import 'package:book_app/data/models/document_model.dart';

import '../../data/repository_impl/add_favorite_repository_impl.dart';
import '../repository/add_favorite_book.dart';

class AddFavoriteBookUseCase {
  final FavoriteBookRepository _favoriteBookRepository;

  AddFavoriteBookUseCase({FavoriteBookRepository? favoriteBookRepository})
      : _favoriteBookRepository =
            favoriteBookRepository ?? FavoriteBookRepositoryImpl();

  Future<void> invokeAddFavoriteBook(Document documents) async {
    return await _favoriteBookRepository.addBookToFavorites(documents);
  }
}
