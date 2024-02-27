import 'package:book_app/data/remote_data_source/search_book_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fake_data.dart';
import '../../mocks.dart';

void main() {
  late SearchBookDataSource _searchBookDataSource;
  late MockSearchBookRepositoryImpl _mockSearchBookRepositoryImpl;

  setUpAll(() {
    _mockSearchBookRepositoryImpl = MockSearchBookRepositoryImpl();
    _searchBookDataSource = SearchBookDataSource();
  });

  test("search-book-repositoryImpl", () async {
    when(
      () => _mockSearchBookRepositoryImpl.getBookResult(any()),
    ).thenAnswer((_) async => searchResultFake);

    final resultest = await _searchBookDataSource.getBookResult("");
    expect(resultest.numFound, 0);
  });
}
