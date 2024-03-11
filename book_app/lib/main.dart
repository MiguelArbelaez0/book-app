import 'package:book_app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/use_cases/add_favorite_book_use.dart';
import 'domain/use_cases/search_book_use_case.dart';
import 'presentation/bloc/search_book_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBookBloc(SeacrhBookUseCase(), AddFavoriteBookUseCase()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // onGenerateRoute: Routes.generateRoute,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
