import 'dart:async';

import 'package:book_app/presentation/bloc/search_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/search_book_use_case.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchBookBloc _searchBookBloc;
  final _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    _searchBookBloc = SearchBookBloc(SeacrhBookUseCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            BlocBuilder<SearchBookBloc, SearchBookState>(
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
                        return ListTile(
                          title: Text(books[index].titleSuggest ?? ""),
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
