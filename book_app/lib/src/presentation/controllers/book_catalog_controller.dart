import '../../domain/entities/book.dart';
import '../../domain/usecases/filter_books.dart';
import '../../domain/usecases/get_books.dart';

class BookCatalogController {
  BookCatalogController({
    required GetBooks getBooks,
    required FilterBooks filterBooks,
  })  : _filterBooks = filterBooks,
        _allBooks = getBooks();

  final FilterBooks _filterBooks;
  final List<Book> _allBooks;

  String _query = '';
  String _selectedGenre = 'All';

  List<Book> get books =>
      _filterBooks(books: _allBooks, query: _query, selectedGenre: _selectedGenre);

  List<String> get genres =>
      ['All', ...{for (final book in _allBooks) book.genre}.toList()..sort()];

  String get selectedGenre => _selectedGenre;

  void onSearchChanged(String value) {
    _query = value;
  }

  void onGenreSelected(String genre) {
    _selectedGenre = genre;
  }
}
