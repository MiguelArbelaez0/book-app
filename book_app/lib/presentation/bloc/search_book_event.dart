// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class RemoveFavoriteBookEvent extends BookEvent {
  final Document document;
  RemoveFavoriteBookEvent({
    required this.document,
  });
}

class GetFavoriteBookEvent extends BookEvent {}
