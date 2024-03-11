import 'dart:async';
import 'dart:math';

import 'package:book_app/data/models/document_model.dart';
import 'package:book_app/data/models/search_result_model.dart';
import 'package:book_app/domain/use_cases/add_favorite_book_use.dart';
import 'package:book_app/domain/use_cases/search_book_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_book_event.dart';

part 'search_book_state.dart';

class SearchBookBloc extends Bloc<BookEvent, BookState> {
  final SeacrhBookUseCase _seacrhBookUseCase;
  final AddFavoriteBookUseCase _addFavoriteBookUseCase;
  SearchBookBloc(this._seacrhBookUseCase, this._addFavoriteBookUseCase)
      : super(SearchBookNormalState(ModelData(books: []))) {
    on<SearchBookResultEvent>((event, emit) => invokeBookResult(event, emit));
    on<AddFavoriteBookEvent>((event, emit) => addFavoritesbooks(event, emit));
  }

  invokeBookResult(SearchBookResultEvent event, Emitter<BookState> emit) async {
    emit(SearchBookLoadingState(state.modelData));
    SearchResult searchResult =
        await _seacrhBookUseCase.invokeResultBook(event.query);
    ModelData modelData = state.modelData.copyWith(books: searchResult.docs);
    emit(SearchBookCompletedState(modelData));
  }

  addFavoritesbooks(AddFavoriteBookEvent event, Emitter<BookState> emit) async {
    emit(BookAddedToFavoritesState(state.modelData));
    await _addFavoriteBookUseCase.invokeAddFavoriteBook(event.document);
    ModelData modeldata =
        state.modelData.copyWith(books: state.modelData.books);
    emit(BookAddedToFavoritesCompleteState(modeldata));
  }
}
