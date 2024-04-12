import 'package:bloc_test/bloc_test.dart';
import 'package:book_app/data/models/search_result_model.dart';
import 'package:book_app/domain/use_cases/add_favorite_book_use.dart';
import 'package:book_app/domain/use_cases/get_favorite_book_use_case.dart';
import 'package:book_app/domain/use_cases/remove_favorite_book_use_case.dart';
import 'package:book_app/domain/use_cases/search_book_use_case.dart';
import 'package:book_app/presentation/bloc/search_book_bloc.dart';
import 'package:book_app/presentation/bloc/search_book_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  late SeacrhBookUseCase _seacrhBookUseCase;
  late MockSearchBookRepository _mockSearchBookRepository;

  setUpAll(() {
    _mockSearchBookRepository = MockSearchBookRepository();
    _seacrhBookUseCase =
        SeacrhBookUseCase(searchBookRepository: _mockSearchBookRepository);
  });
  group("test invoke result", () {
    setUp(() async {
      when(() => _mockSearchBookRepository.onGetBook(any()))
          .thenAnswer((_) async => searchResultFake);

      await _seacrhBookUseCase.invokeResultBook("");
    });

    blocTest(
      "when query is empety",
      build: () => SearchBookBloc(
        _seacrhBookUseCase,
        AddFavoriteBookUseCase(
            favoriteBookRepository: MockAddFavoriteBookRepository()),
        GetBookFavoriteUseCase(
            getFavoriteBookRepository: MockGetFavoriteBookRepository()),
        RemoveFavoriteBookUseCase(
            removefromFavoritesBookRepsoitory:
                MockRemovefromFavoritesBookRepsoitory()),
      ),
      act: (bloc) => bloc.add(SearchBookResultEvent(query: "")),
      expect: () => [
        isA<SearchBookLoadingState>(),
        isA<SearchBookCompletedState>(),
      ],
    );
  });
}
