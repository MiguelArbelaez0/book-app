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
        title: const Text("Book Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          )
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
              margin: EdgeInsets.only(right: 16.0),
              child: CachedNetworkImage(
                imageUrl:
                    "https://covers.openlibrary.org/a/olid/${document.coverId}-M.jpg",
              ),
            ),
            Text(
              document.title ?? "",
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text("Authors: ${document.authorName?.join(', ') ?? 'Unknown'}"),
            const SizedBox(height: 8.0),
            Text(
                "First Publish Year: ${document.firstPublishYear?.toString() ?? 'Unknown'}"),
            const SizedBox(height: 8.0),
            Text("Publisher: ${document.publisher?.join(', ') ?? 'Unknown'}"),
            const SizedBox(height: 8.0),
            Text("Language: ${document.language?.join(', ') ?? 'Unknown'}"),
          ],
        ),
      ),
    );
  }
}
