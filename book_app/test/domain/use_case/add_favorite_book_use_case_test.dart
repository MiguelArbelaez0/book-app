import 'package:book_app/domain/use_cases/add_favorite_book_use.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.setMockInitialValues({});
  late MockAddFavoriteBookRepository _mockAddFavoriteBookRepository;
  late AddFavoriteBookUseCase _addFavoriteBookUseCase;

  setUpAll(() {
    _mockAddFavoriteBookRepository = MockAddFavoriteBookRepository();
    _addFavoriteBookUseCase = AddFavoriteBookUseCase();
  });
  test("", () async {
    when(() => _mockAddFavoriteBookRepository.addBookToFavorites(documentFake))
        .thenAnswer((_) => Future.value());

    await _mockAddFavoriteBookRepository.addBookToFavorites(documentFake);
    // await _addFavoriteBookUseCase.invokeAddFavoriteBook(documentFake);

    verify(
        () => _mockAddFavoriteBookRepository.addBookToFavorites(documentFake));
  });
}
