import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:book_app/data/models/document_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  setUpAll(() {
    registerFallbackValue(documentFake);
  });

  late LocalDataSource _localDataSource;
  late MockAddFavoriteBookRepositoryImpl _mockAddFavoriteBookRepositoryImpl;

  setUp(() {
    _localDataSource = LocalDataSource();
    _mockAddFavoriteBookRepositoryImpl = MockAddFavoriteBookRepositoryImpl();
  });

  test("add-favorite-book", () async {
    when(() => _mockAddFavoriteBookRepositoryImpl.addBookToFavorites(any()))
        .thenAnswer((_) => Future.value());

    await _mockAddFavoriteBookRepositoryImpl.addBookToFavorites(documentFake);

    verify(() =>
        _mockAddFavoriteBookRepositoryImpl.addBookToFavorites(documentFake));
  });
}
