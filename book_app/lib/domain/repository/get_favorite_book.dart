import 'package:book_app/data/models/document_model.dart';

abstract class GetFavoriteBookRepository {
  Future<List<Document>> onGetFavoriteBook();
}
