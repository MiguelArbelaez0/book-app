part of 'search_book_bloc.dart';

abstract class SearchBookState {}

class SearchBookNormalState extends SearchBookState {}

class SearchBookLoadingState extends SearchBookState {}

class SearchBookCompletedState extends SearchBookState {
  final ModelData modelData;

  SearchBookCompletedState({required this.modelData});
}

class ModelData {
  final List<Document> books;
  ModelData({required this.books});

  ModelData copyWith({List<Document>? books}) =>
      ModelData(books: books ?? this.books);
}
