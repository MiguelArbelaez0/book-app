import 'package:flutter/material.dart';

import 'src/data/repositories/in_memory_book_repository.dart';
import 'src/domain/usecases/filter_books.dart';
import 'src/domain/usecases/get_books.dart';
import 'src/presentation/controllers/book_catalog_controller.dart';
import 'src/presentation/pages/book_catalog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late final BookCatalogController _controller = BookCatalogController(
    getBooks: GetBooks(const InMemoryBookRepository()),
    filterBooks: FilterBooks(),
  );

  void _toggleTheme() {
    setState(() {
      _themeMode = switch (_themeMode) {
        ThemeMode.dark => ThemeMode.light,
        _ => ThemeMode.dark,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App 2026',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: BookCatalogPage(
        controller: _controller,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
