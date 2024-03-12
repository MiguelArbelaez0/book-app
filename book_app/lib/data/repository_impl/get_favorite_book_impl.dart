import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:book_app/data/models/document_model.dart';

import '../../domain/repository/get_favorite_book.dart';

class GetFavoriteBookRepositoyImpl implements GetFavoriteBookRepository {
  final LocalDataSource _localDataSource;

  GetFavoriteBookRepositoyImpl({LocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? LocalDataSource();
  @override
  Future<List<Document>> onGetFavoriteBook() async {
    return await _localDataSource.getFavoriteBooks();
  }
}
