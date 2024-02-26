import 'package:bloc/bloc.dart';
part 'search_book_event.dart';
part 'search_book_state.dart';

class SearchBookBloc extends Bloc<SearchBookEvent, SearchBookState> {
  SearchBookBloc() : super(SearchBookInitial()) {
    on<SearchBookEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
