import 'package:flutter/material.dart';

import '../controllers/book_catalog_controller.dart';
import '../widgets/book_list_item.dart';

class BookCatalogPage extends StatefulWidget {
  const BookCatalogPage({
    super.key,
    required this.controller,
    required this.onToggleTheme,
  });

  final BookCatalogController controller;
  final VoidCallback onToggleTheme;

  @override
  State<BookCatalogPage> createState() => _BookCatalogPageState();
}

class _BookCatalogPageState extends State<BookCatalogPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredBooks = widget.controller.books;

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
              onChanged: (value) {
                setState(() {
                  widget.controller.onSearchChanged(value);
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search by title or author',
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.controller.genres
                    .map(
                      (genre) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(genre),
                          selected: widget.controller.selectedGenre == genre,
                          onSelected: (_) {
                            setState(() {
                              widget.controller.onGenreSelected(genre);
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
              child: filteredBooks.isEmpty
                  ? const Center(child: Text('No books found. Try another filter.'))
                  : ListView.builder(
                      itemCount: filteredBooks.length,
                      itemBuilder: (context, index) =>
                          BookListItem(book: filteredBooks[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
