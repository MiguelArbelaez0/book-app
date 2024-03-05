import 'dart:async';

import 'package:book_app/data/models/document_model.dart';
import 'package:book_app/data/models/search_result_model.dart';
import 'package:book_app/domain/use_cases/search_book_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_book_event.dart';
part 'search_book_state.dart';

class SearchBookBloc extends Bloc<SearchBookEvent, SearchBookState> {
  final SeacrhBookUseCase _seacrhBookUseCase;

  SearchBookBloc(this._seacrhBookUseCase)
      : super(SearchBookNormalState(ModelData(books: []))) {
    on<SearchBookResultEvent>((event, emit) => invokeBookResult(event, emit));
  }

  invokeBookResult(
      SearchBookResultEvent event, Emitter<SearchBookState> emit) async {
    emit(SearchBookLoadingState(state.modelData));
    SearchResult searchResult =
        await _seacrhBookUseCase.invokeResultBook(event.query);
    ModelData modelData = state.modelData.copyWith(books: searchResult.docs);
    emit(SearchBookCompletedState(modelData));
  }
}
