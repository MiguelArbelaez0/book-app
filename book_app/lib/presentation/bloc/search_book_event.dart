// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/models/document_model.dart';

abstract class BookEvent {}

///recibe una query o para hacer la busqueda del libro
class SearchBookResultEvent extends BookEvent {
  final String query;
  SearchBookResultEvent({required this.query});
}

///recibe un documento (libro) para guardarlo en dispositivo
class AddFavoriteBookEvent extends BookEvent {
  final Document document;
  AddFavoriteBookEvent({
    required this.document,
  });
}

/// Recibe un documento (libro)  para eliminarlo de los favoritos.
class RemoveFavoriteBookEvent extends BookEvent {
  final Document document;
  RemoveFavoriteBookEvent({
    required this.document,
  });
}

/// Evento que se dispara cuando se solicita obtener los libros favoritos.
class GetFavoriteBookEvent extends BookEvent {}
