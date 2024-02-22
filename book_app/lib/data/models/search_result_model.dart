import 'package:book_app/data/models/document_model.dart';

class SearchResult {
  final int start;
  final int numFound;
  final List<Document> docs;

  SearchResult(
      {required this.start, required this.numFound, required this.docs});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      start: json['start'],
      numFound: json['numFound'],
      docs: (json['docs'] as List).map((i) => Document.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'numFound': numFound,
      'docs': docs.map((doc) => doc.toJson()).toList(),
    };
  }
}
