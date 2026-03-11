class Book {
  const Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.year,
    required this.rating,
  });

  final String title;
  final String author;
  final String genre;
  final int year;
  final double rating;
}
