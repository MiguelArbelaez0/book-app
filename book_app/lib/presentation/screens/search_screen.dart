import 'dart:async';
import 'package:book_app/domain/use_cases/get_favorite_book_use_case.dart';
import 'package:book_app/presentation/bloc/search_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/add_favorite_book_use.dart';
import '../../domain/use_cases/search_book_use_case.dart';
import '../bloc/search_book_event.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchBookBloc _searchBookBloc;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    _searchBookBloc = SearchBookBloc(SeacrhBookUseCase(),
        AddFavoriteBookUseCase(), GetBookFavoriteUseCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Books",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                _debounceTimer?.cancel();
                _debounceTimer = Timer(const Duration(seconds: 5), () {
                  _searchBookBloc.add(SearchBookResultEvent(query: value));
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SearchBookBloc, BookState>(
              bloc: _searchBookBloc,
              builder: (context, state) {
                final books = state.modelData.books ?? [];
                if (state is SearchBookLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchBookCompletedState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (BuildContext context, int index) {
                        final book = books[index];
                        return ListTile(
                          title: Text(books[index].titleSuggest ?? ""),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _searchBookBloc.add(
                                      AddFavoriteBookEvent(document: book));
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.info_outline,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    'detail_screen',
                                    arguments: book,
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
