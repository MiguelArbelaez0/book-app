part of 'search_book_bloc.dart';

abstract class BookState {
  final ModelData modelData;

  BookState(this.modelData);
}

class SearchBookNormalState extends BookState {
  SearchBookNormalState(super.modelData);
}

class SearchBookLoadingState extends BookState {
  SearchBookLoadingState(super.modelData);
}

class SearchBookCompletedState extends BookState {
  SearchBookCompletedState(
    super.modelData,
  );
}

class BookAddedToFavoritesState extends BookState {
  BookAddedToFavoritesState(super.modelData);
}

class BookAddedToFavoritesCompleteState extends BookState {
  BookAddedToFavoritesCompleteState(super.modelData);
}

class GetBookLoadingState extends BookState {
  GetBookLoadingState(super.modelData);
}

class GetFavoriteBookCompletedState extends BookState {
  GetFavoriteBookCompletedState(super.modelData);
}

class RemoveBookFavoriteLoadingState extends BookState {
  RemoveBookFavoriteLoadingState(super.modelData);
}

class RemoveFavoriteBookCompleteState extends BookState {
  RemoveFavoriteBookCompleteState(super.modelData);
}

class ModelData {
  final List<Document>? books;
  final List<Document>? favoriteBooks;
  final Document? bookRemove;
  ModelData(
      {required this.books,
      required this.favoriteBooks,
      required this.bookRemove});

  ModelData copyWith(
          {List<Document>? books,
          List<Document>? favoriteBooks,
          Document? bookRemove}) =>
      ModelData(
        books: books ?? this.books,
        favoriteBooks: favoriteBooks ?? this.favoriteBooks,
        bookRemove: bookRemove ?? this.bookRemove,
      );
}
