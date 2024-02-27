import 'package:book_app/domain/use_cases/search_book_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  late SeacrhBookUseCase _searchBookUseCase;
  late MockSearchBookRepository _mockSearchBookRepository;

  setUpAll(() {
    _mockSearchBookRepository = MockSearchBookRepository();
    _searchBookUseCase =
        SeacrhBookUseCase(searchBookRepository: _mockSearchBookRepository);
  });
  test("use-case-search-book", () async {
    //configurar el test = emular las llamadas
    when(() => _mockSearchBookRepository.onGetBook(any()))
        .thenAnswer((_) async => searchResultFake);
    //hacer el llamdo real
    final result = await _searchBookUseCase.invokeResultBook("");
    //comprobar el test
    expect(result.start, 1);
  });
}
