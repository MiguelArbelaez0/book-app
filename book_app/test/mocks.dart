import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:book_app/data/remote_data_source/search_book_data_source.dart';
import 'package:book_app/domain/repository/add_favorite_book.dart';
import 'package:book_app/domain/repository/get_favorite_book.dart';
import 'package:book_app/domain/repository/remove_favorite_book.dart';
import 'package:book_app/domain/repository/search_book_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchBookRepositoryImpl extends Mock
    implements SearchBookDataSource {}

class MockAddFavoriteBookRepositoryImpl extends Mock
    implements LocalDataSource {}

class MockGetFavoriteBookRepositoryImpl extends Mock
    implements LocalDataSource {}

class MockRemoveFavoriteBookRepositoryImpl extends Mock
    implements LocalDataSource {}

class MockAddFavoriteBookRepository extends Mock
    implements FavoriteBookRepository {}

class MockSearchBookRepository extends Mock implements SearchBookRepository {}

class MockGetFavoriteBookRepository extends Mock
    implements GetFavoriteBookRepository {}

class MockRemovefromFavoritesBookRepsoitory extends Mock
    implements RemovefromFavoritesBookRepsoitory {}
