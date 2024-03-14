// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_app/data/models/document_model.dart';
import 'package:book_app/data/repository_impl/remove_favorite_repository_impl.dart';
import 'package:book_app/domain/repository/remove_favorite_book.dart';

class RemoveFavoriteBookUseCase {
  late final RemovefromFavoritesBookRepsoitory
      _removefromFavoritesBookRepsoitory;
  RemoveFavoriteBookUseCase(
      {RemovefromFavoritesBookRepsoitory? removefromFavoritesBookRepsoitory})
      : _removefromFavoritesBookRepsoitory =
            removefromFavoritesBookRepsoitory ??
                RemoveFavoriteBookRepositoryImpl();

  Future<void> invokeRemoveFavoriteBook(Document documents) async {
    return await _removefromFavoritesBookRepsoitory
        .removeFromFavorites(documents);
  }
}
