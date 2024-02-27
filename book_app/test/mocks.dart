import 'package:book_app/data/remote_data_source/search_book_data_source.dart';
import 'package:book_app/domain/repository/search_book_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchBookRepository extends Mock implements SearchBookRepository {}

class MockSearchBookRepositoryImpl extends Mock
    implements SearchBookDataSource {}
