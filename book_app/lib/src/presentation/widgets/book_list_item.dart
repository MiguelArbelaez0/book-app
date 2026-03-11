import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
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
  }
}
