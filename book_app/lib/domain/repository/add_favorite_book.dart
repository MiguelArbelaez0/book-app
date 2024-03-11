import 'package:book_app/data/models/document_model.dart';

abstract class FavoriteBookRepository {
  Future<void> addBookToFavorites(Document documents);
}
