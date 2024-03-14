import 'package:book_app/data/models/document_model.dart';

abstract class RemovefromFavoritesBookRepsoitory {
  Future<void> removeFromFavorites(Document documents);
}
