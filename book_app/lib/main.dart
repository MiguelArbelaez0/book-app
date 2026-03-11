import 'package:flutter/material.dart';

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
      home: HomePage(onToggleTheme: _toggleTheme),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedGenre = 'All';
  final List<Book> _books = const [
    Book(
      title: 'Clean Architecture',
      author: 'Robert C. Martin',
      genre: 'Engineering',
      year: 2017,
      rating: 4.7,
    ),
    Book(
      title: 'Atomic Habits',
      author: 'James Clear',
      genre: 'Productivity',
      year: 2018,
      rating: 4.8,
    ),
    Book(
      title: 'The Pragmatic Programmer',
      author: 'Andrew Hunt',
      genre: 'Engineering',
      year: 2019,
      rating: 4.9,
    ),
    Book(
      title: 'Project Hail Mary',
      author: 'Andy Weir',
      genre: 'Sci-Fi',
      year: 2021,
      rating: 4.6,
    ),
    Book(
      title: 'Sapiens',
      author: 'Yuval Noah Harari',
      genre: 'History',
      year: 2015,
      rating: 4.5,
    ),
  ];

  List<String> get _genres =>
      ['All', ...{for (final book in _books) book.genre}.toList()..sort()];

  List<Book> get _filteredBooks {
    final query = _searchController.text.trim().toLowerCase();
    return _books.where((book) {
      final matchesGenre = _selectedGenre == 'All' || book.genre == _selectedGenre;
      final matchesQuery = query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesGenre && matchesQuery;
    }).toList()
      ..sort((a, b) => b.rating.compareTo(a.rating));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredBooks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book App 2026'),
        actions: [
          IconButton(
            tooltip: 'Change theme',
            onPressed: widget.onToggleTheme,
            icon: const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search by title or author',
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _genres
                    .map(
                      (genre) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(genre),
                          selected: _selectedGenre == genre,
                          onSelected: (_) {
                            setState(() {
                              _selectedGenre = genre;
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: filtered.isEmpty
                  ? const Center(child: Text('No books found. Try another filter.'))
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final book = filtered[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(child: Text(book.year.toString())),
                            title: Text(book.title),
                            subtitle: Text('${book.author} • ${book.genre}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 18),
                                const SizedBox(width: 4),
                                Text(book.rating.toStringAsFixed(1)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  const Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.year,
    required this.rating,
  });

  final String title;
  final String author;
  final String genre;
  final int year;
  final double rating;
}
