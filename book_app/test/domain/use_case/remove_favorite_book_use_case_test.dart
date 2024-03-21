import 'package:book_app/domain/use_cases/remove_favorite_book_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  late MockRemovefromFavoritesBookRepsoitory
      _mockRemovefromFavoritesBookRepsoitory;
  late RemoveFavoriteBookUseCase _removeFavoriteBookUseCase;

  setUpAll(() {
    _mockRemovefromFavoritesBookRepsoitory =
        MockRemovefromFavoritesBookRepsoitory();
    _removeFavoriteBookUseCase = RemoveFavoriteBookUseCase();
  });

  test("remove-book-use-case", () async {
    when(() => _mockRemovefromFavoritesBookRepsoitory
        .removeFromFavorites(documentFake)).thenAnswer((_) => Future.value());

    await _mockRemovefromFavoritesBookRepsoitory
        .removeFromFavorites(documentFake);

    verify(() => _mockRemovefromFavoritesBookRepsoitory
        .removeFromFavorites(documentFake));
  });
}
