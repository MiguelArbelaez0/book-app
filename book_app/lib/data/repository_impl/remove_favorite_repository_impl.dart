// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:book_app/data/models/document_model.dart';
import 'package:book_app/domain/repository/remove_favorite_book.dart';

class RemoveFavoriteBookRepositoryImpl
    extends RemovefromFavoritesBookRepsoitory {
  final LocalDataSource _localDataSource;

  RemoveFavoriteBookRepositoryImpl({LocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? LocalDataSource();

  @override
  Future<void> removeFromFavorites(Document documents) async {
    await _localDataSource.removeBookFromFavorites(documents);
  }
}
