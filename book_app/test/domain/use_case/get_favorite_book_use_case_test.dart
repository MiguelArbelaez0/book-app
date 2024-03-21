import 'package:book_app/domain/use_cases/get_favorite_book_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  late MockGetFavoriteBookRepository _mockGetFavoriteBookRepository;

  late GetBookFavoriteUseCase _getBookFavoriteUseCase;

  setUpAll(() {
    _mockGetFavoriteBookRepository = MockGetFavoriteBookRepository();
    _getBookFavoriteUseCase = GetBookFavoriteUseCase();
  });

  test("get-favorite-book", () async {
    when(() => _mockGetFavoriteBookRepository.onGetFavoriteBook())
        .thenAnswer((_) async => fakeList);

    final result = await _getBookFavoriteUseCase.invokeGetFavoriteBook();

    expect(result, fakeList);
  });
}
