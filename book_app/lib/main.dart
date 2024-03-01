import 'package:book_app/presentation/home_screen.dart';
import 'package:book_app/presentation/screens/bloc/search_book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/use_cases/search_book_use_case.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBookBloc(SeacrhBookUseCase()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // onGenerateRoute: Routes.generateRoute,
        home: const HomeScreen(),
      ),
    );
  }
}
