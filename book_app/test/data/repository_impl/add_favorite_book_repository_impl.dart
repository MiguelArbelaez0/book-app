import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  late MockAddFavoriteBookRepositoryImpl _mockAddFavoriteBookRepositoryImpl;

  late LocalDataSource _localDataSource;

  setUpAll(() {
    _mockAddFavoriteBookRepositoryImpl = MockAddFavoriteBookRepositoryImpl();
    _localDataSource = LocalDataSource();
  });

  test("", () async {
    when(() => _mockAddFavoriteBookRepositoryImpl.addBookToFavorites(document));
  });
}
