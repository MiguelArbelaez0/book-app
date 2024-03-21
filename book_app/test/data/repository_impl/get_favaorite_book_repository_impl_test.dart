import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({}); //Inicializa shared_preferences
  late LocalDataSource _localDataSource;
  late MockGetFavoriteBookRepositoryImpl _mockGetFavoriteBookRepositoryImpl;

  setUpAll(() {
    _mockGetFavoriteBookRepositoryImpl = MockGetFavoriteBookRepositoryImpl();
    _localDataSource = LocalDataSource();
  });

  test("search-book-repositoryImpl", () async {
    when(
      () => _mockGetFavoriteBookRepositoryImpl.getFavoriteBooks(),
    ).thenAnswer((_) async => fakeList);

    final resultest = await _localDataSource.getFavoriteBooks();
    expect(resultest, fakeList);
  });
}
