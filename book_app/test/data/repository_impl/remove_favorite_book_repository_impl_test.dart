import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  late LocalDataSource _localDataSource;
  late MockRemoveFavoriteBookRepositoryImpl
      _mockRemoveFavoriteBookRepositoryImpl;

  setUpAll(() {
    _localDataSource = LocalDataSource();
    _mockRemoveFavoriteBookRepositoryImpl =
        MockRemoveFavoriteBookRepositoryImpl();
  });
  test("remove-favorite-book", () async {
    when(() => _mockRemoveFavoriteBookRepositoryImpl.removeBookFromFavorites(
        documentFake)).thenAnswer((_) => Future.value());

    await _mockRemoveFavoriteBookRepositoryImpl
        .removeBookFromFavorites(documentFake);

    verify(() => _mockRemoveFavoriteBookRepositoryImpl
        .removeBookFromFavorites(documentFake));
  });
}
