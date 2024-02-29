part of 'search_book_bloc.dart';

abstract class SearchBookEvent {}

class SearchBookResultEvent extends SearchBookEvent {
  final String query;
  SearchBookResultEvent({required this.query});
}
