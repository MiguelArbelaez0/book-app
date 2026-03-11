import '../entities/book.dart';

class FilterBooks {
  List<Book> call({
    required List<Book> books,
    required String query,
    required String selectedGenre,
  }) {
    final normalizedQuery = query.trim().toLowerCase();

    return books.where((book) {
      final matchesGenre = selectedGenre == 'All' || book.genre == selectedGenre;
      final matchesQuery = normalizedQuery.isEmpty ||
          book.title.toLowerCase().contains(normalizedQuery) ||
          book.author.toLowerCase().contains(normalizedQuery);
      return matchesGenre && matchesQuery;
    }).toList()
      ..sort((a, b) => b.rating.compareTo(a.rating));
  }
}
