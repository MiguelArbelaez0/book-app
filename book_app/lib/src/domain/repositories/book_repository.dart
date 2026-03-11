import '../entities/book.dart';

abstract class BookRepository {
  List<Book> getBooks();
}
