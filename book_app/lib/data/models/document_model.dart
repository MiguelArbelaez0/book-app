class Document {
  final String? titleSuggest;
  final List<String>? editionKey;
  final int? coverId;
  final List<String>? isbn;
  final bool? hasFulltext;
  final List<String>? authorName;
  final List<String>? contributor;
  final List<String>? authorKey;
  final int? firstPublishYear;
  final String? title;
  final List<String>? publisher;
  final List<String>? language;

  Document(
      {required this.titleSuggest,
      required this.editionKey,
      required this.coverId,
      required this.isbn,
      required this.hasFulltext,
      required this.authorName,
      required this.contributor,
      required this.authorKey,
      required this.firstPublishYear,
      required this.title,
      required this.publisher,
      required this.language});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      titleSuggest: json['title_suggest'] ?? "",
      editionKey: List<String>.from(json['edition_key'] ?? [""]),
      coverId: json['cover_i'] ?? 0,
      isbn: List<String>.from(json['isbn'] ?? [""]),
      hasFulltext: json['has_fulltext'] ?? false,
      authorName: List<String>.from(json['author_name'] ?? [""]),
      contributor: List<String>.from(json['contributor'] ?? [""]),
      authorKey: List<String>.from(json['author_key'] ?? [""]),
      firstPublishYear: json['first_publish_year'] ?? 0,
      title: json['title'] ?? "",
      publisher: List<String>.from(json['publisher'] ?? [""]),
      language: List<String>.from(json['language'] ?? [""]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title_suggest': titleSuggest,
      'edition_key': editionKey,
      'cover_i': coverId,
      'isbn': isbn,
      'has_fulltext': hasFulltext,
      'author_name': authorName,
      'contributor': contributor,
      'author_key': authorKey,
      'first_publish_year': firstPublishYear,
      'title': title,
      'publisher': publisher,
      'language': language,
    };
  }
}
