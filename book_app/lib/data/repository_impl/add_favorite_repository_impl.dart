import 'package:book_app/data/models/document_model.dart';

import '../../domain/repository/add_favorite_book.dart';
import '../local data source/local_data_source.dart';

class FavoriteBookRepositoryImpl implements FavoriteBookRepository {
  final LocalDataSource _localDataSource;

  FavoriteBookRepositoryImpl({LocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? LocalDataSource();

  @override
  Future<void> addBookToFavorites(Document documents) async {
    return await _localDataSource.addBookToFavorites(documents);
  }
}
