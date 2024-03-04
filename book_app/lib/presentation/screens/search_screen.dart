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

  @override
  void initState() {
    _searchBookBloc = SearchBookBloc(SeacrhBookUseCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(20),
          height: 325,
          width: 50,
          child: TextField(
            onChanged: (value) =>
                _searchBookBloc.add(SearchBookResultEvent(query: value)),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        BlocBuilder<SearchBookBloc, SearchBookState>(
          bloc: _searchBookBloc,
          builder: (context, state) {
            debugPrint('El estado actual es: $state');
            if (state is SearchBookLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchBookCompletedState) {
              final books = state.modelData.books ?? [];
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(books[index].title),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ]),
    );
  }
}
