import 'package:book_app/domain/use_cases/add_favorite_book_use.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
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

    verify(
        () => _mockAddFavoriteBookRepository.addBookToFavorites(documentFake));
  });
}
