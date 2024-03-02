part of 'search_book_bloc.dart';

abstract class SearchBookState {
  final ModelData modelData;

  SearchBookState(this.modelData);
}

class SearchBookNormalState extends SearchBookState {
  SearchBookNormalState(super.modelData);
}

class SearchBookLoadingState extends SearchBookState {
  SearchBookLoadingState(super.modelData);
}

class SearchBookCompletedState extends SearchBookState {
  SearchBookCompletedState(
    super.modelData,
  );
}

class ModelData {
  final List<Document> books;
  ModelData({required this.books});

  ModelData copyWith({List<Document>? books}) =>
      ModelData(books: books ?? this.books);
}
