import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  late LocalDataSource _localDataSource;
  late MockGetFavoriteBookRepositoryImpl _mockGetFavoriteBookRepositoryImpl;

  setUpAll(() {
    _localDataSource = LocalDataSource();
    _mockGetFavoriteBookRepositoryImpl = MockGetFavoriteBookRepositoryImpl();
  });

  test("get-favorite-book", () async {
    when(() => _mockGetFavoriteBookRepositoryImpl.getFavoriteBooks())
        .thenAnswer((_) => fakeList);
  });
}
