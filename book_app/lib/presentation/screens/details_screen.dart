import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/document_model.dart';

class DetailScreen extends StatelessWidget {
  final Document document;

  const DetailScreen({
    Key? key,
    required this.document,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Detalles del Libro"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 217,
              height: 295,
              margin: const EdgeInsets.all(50),
              child: CachedNetworkImage(
                imageUrl:
                    "https://covers.openlibrary.org/a/olid/OL23919A-M.jpg",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Container(
                  color: Colors.red,
                ),
              ),
            ),
            Text(
              document.title ?? "",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D0842)),
            ),
            const SizedBox(height: 10),
            Text(
              "Author: ${document.authorName?.join() ?? 'no se encontraron autores'}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D0842),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "First Publish Year: ${document.firstPublishYear?.toString() ?? 'N/A'}",
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF0D0842),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Language: ${document.language?.join(', ') ?? 'Language not found'}",
              style: const TextStyle(fontSize: 16, color: Color(0xFF0D0842)),
            )
          ],
        ),
      ),
    );
  }
}
