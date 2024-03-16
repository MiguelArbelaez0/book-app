import 'dart:convert';

import 'package:book_app/data/local%20data%20source/local_data_source.dart';
import 'package:book_app/data/models/document_model.dart';
import 'package:book_app/data/models/search_result_model.dart';
import 'package:book_app/domain/use_cases/add_favorite_book_use.dart';
import 'package:book_app/domain/use_cases/get_favorite_book_use_case.dart';
import 'package:book_app/domain/use_cases/search_book_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/use_cases/remove_favorite_book_use_case.dart';
import 'search_book_event.dart';
part 'search_book_state.dart';

class SearchBookBloc extends Bloc<BookEvent, BookState> {
  final SeacrhBookUseCase _seacrhBookUseCase;
  final AddFavoriteBookUseCase _addFavoriteBookUseCase;
  final GetBookFavoriteUseCase _getBookFavoriteUseCase;
  final RemoveFavoriteBookUseCase _removeFavoriteBookUseCase;
  SearchBookBloc(
    this._seacrhBookUseCase,
    this._addFavoriteBookUseCase,
    this._getBookFavoriteUseCase,
    this._removeFavoriteBookUseCase,
  ) : super(SearchBookNormalState(ModelData(
          books: [],
          favoriteBooks: [],
          bookRemove: null,
        ))) {
    on<SearchBookResultEvent>((event, emit) => invokeBookResult(event, emit));
    on<AddFavoriteBookEvent>((event, emit) => addFavoritesbooks(event, emit));
    on<GetFavoriteBookEvent>((event, emit) => getFavoriteBooks(event, emit));
    on<RemoveFavoriteBookEvent>(
        (event, emit) => removeFavoriteBook(event, emit));
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

  getFavoriteBooks(GetFavoriteBookEvent event, Emitter<BookState> emit) async {
    emit(GetBookLoadingState(state.modelData));
    List<Document> favoriteBooks =
        await _getBookFavoriteUseCase.invokeGetFavoriteBook();
    ModelData modelData =
        state.modelData.copyWith(favoriteBooks: favoriteBooks);
    emit(GetFavoriteBookCompletedState(modelData));
  }

  removeFavoriteBook(
      RemoveFavoriteBookEvent event, Emitter<BookState> emit) async {
    emit(RemoveBookFavoriteLoadingState(state.modelData));
    _removeFavoriteBookUseCase.invokeRemoveFavoriteBook(event.document);
    ModelData modelData =
        state.modelData.copyWith(bookRemove: state.modelData.bookRemove);
    emit(RemoveFavoriteBookCompleteState(modelData));
  }
}
