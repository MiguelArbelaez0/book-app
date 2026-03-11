import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';

class InMemoryBookRepository implements BookRepository {
  const InMemoryBookRepository();

  @override
  List<Book> getBooks() {
    return const [
      Book(
        title: 'Clean Architecture',
        author: 'Robert C. Martin',
        genre: 'Engineering',
        year: 2017,
        rating: 4.7,
      ),
      Book(
        title: 'Atomic Habits',
        author: 'James Clear',
        genre: 'Productivity',
        year: 2018,
        rating: 4.8,
      ),
      Book(
        title: 'The Pragmatic Programmer',
        author: 'Andrew Hunt',
        genre: 'Engineering',
        year: 2019,
        rating: 4.9,
      ),
      Book(
        title: 'Project Hail Mary',
        author: 'Andy Weir',
        genre: 'Sci-Fi',
        year: 2021,
        rating: 4.6,
      ),
      Book(
        title: 'Sapiens',
        author: 'Yuval Noah Harari',
        genre: 'History',
        year: 2015,
        rating: 4.5,
      ),
    ];
  }
}
