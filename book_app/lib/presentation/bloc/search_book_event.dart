import '../../data/models/document_model.dart';

abstract class BookEvent {}

class SearchBookResultEvent extends BookEvent {
  final String query;
  SearchBookResultEvent({required this.query});
}

class AddFavoriteBookEvent extends BookEvent {
  final Document document;
  AddFavoriteBookEvent({
    required this.document,
  });
}
