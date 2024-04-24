import 'package:book_app/domain/use_cases/add_favorite_book_use.dart';
import 'package:book_app/domain/use_cases/get_favorite_book_use_case.dart';
import 'package:book_app/domain/use_cases/remove_favorite_book_use_case.dart';
import 'package:book_app/domain/use_cases/search_book_use_case.dart';
import 'package:book_app/presentation/bloc/search_book_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_book_event.dart';

// class FavoritesScreen extends StatefulWidget {
//   const FavoritesScreen({Key? key}) : super(key: key);

//   @override
//   State<FavoritesScreen> createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   late final SearchBookBloc _searchBookBloc;

//   @override
//   void initState() {
//     super.initState();
//     _searchBookBloc = SearchBookBloc(
//         SeacrhBookUseCase(),
//         AddFavoriteBookUseCase(),
//         GetBookFavoriteUseCase(),
//         RemoveFavoriteBookUseCase());
//     _searchBookBloc.add(GetFavoriteBookEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: const Text(
//           'Favorite Books',
//           style: TextStyle(color: Colors.green),
//         ),
//       ),
//       body: BlocBuilder<SearchBookBloc, BookState>(
//         bloc: _searchBookBloc,
//         builder: (context, state) {
//           if (state is GetBookLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is GetFavoriteBookCompletedState) {
//             return ListView.builder(
//               itemCount: state.modelData.favoriteBooks?.length ?? 0,
//               itemBuilder: (context, index) {
//                 final book = state.modelData.favoriteBooks![index];
//                 return ListTile(
//                   title: Text(book.title ?? ""),
//                   trailing: GestureDetector(
//                     onTap: () {
//                       _searchBookBloc
//                           .add(RemoveFavoriteBookEvent(document: book));
//                       _searchBookBloc.add(GetFavoriteBookEvent());
//                     },
//                     child: const Icon(Icons.bookmark, color: Colors.green),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const Center(child: Text('No favorite books found'));
//           }
//         },
//       ),
//     );
//   }
// }
// class FavoritesScreen extends StatefulWidget {
//   const FavoritesScreen({super.key});

//   @override
//   State<FavoritesScreen> createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   late final SearchBookBloc _searchBookBloc;

//   @override
//   void initState() {
//     super.initState();
//     _searchBookBloc = SearchBookBloc(
//         SeacrhBookUseCase(),
//         AddFavoriteBookUseCase(),
//         GetBookFavoriteUseCase(),
//         RemoveFavoriteBookUseCase());
//     _searchBookBloc.add(GetFavoriteBookEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               color: const Color(0xFF335247),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 150),
//                 decoration: const BoxDecoration(
//                     color: Color(0xFFFFFFFF),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30))),
//                 height: 703,
//                 width: 392,
//                 child: Column(children: [
//                   Container(
//                     margin: const EdgeInsets.only(top: 10),
//                     child: const Text(
//                       "Mis Libros",
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF335247),
//                       ),
//                     ),
//                   ),
//                 ]),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late final SearchBookBloc _searchBookBloc;

  @override
  void initState() {
    super.initState();
    _searchBookBloc = SearchBookBloc(
        SeacrhBookUseCase(),
        AddFavoriteBookUseCase(),
        GetBookFavoriteUseCase(),
        RemoveFavoriteBookUseCase());
    _searchBookBloc.add(GetFavoriteBookEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF335247),
              child: Container(
                margin: const EdgeInsets.only(top: 150),
                decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 703,
                width: 392,
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Mis Libros",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF335247),
                      ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<SearchBookBloc, BookState>(
                      bloc: _searchBookBloc,
                      builder: (context, state) {
                        if (state is GetBookLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is GetFavoriteBookCompletedState) {
                          return ListView.builder(
                            itemCount:
                                state.modelData.favoriteBooks?.length ?? 0,
                            itemBuilder: (context, index) {
                              final book =
                                  state.modelData.favoriteBooks![index];
                              return ListTile(
                                title: Text(book.title ?? ""),
                                trailing: GestureDetector(
                                  onTap: () {
                                    _searchBookBloc.add(RemoveFavoriteBookEvent(
                                        document: book));
                                    _searchBookBloc.add(GetFavoriteBookEvent());
                                  },
                                  child: const Icon(Icons.bookmark,
                                      color: Colors.green),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: Text('No favorite books found'));
                        }
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
