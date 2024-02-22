class DocDetails {
  int numFound;
  int start;
  bool numFoundExact;
  List<DocDetailsDoc> docs;

  DocDetails({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
  });

  factory DocDetails.fromMap(Map<String, dynamic> map) => DocDetails(
        numFound: map["numFound"],
        start: map["start"],
        numFoundExact: map["numFoundExact"],
        docs: List<DocDetailsDoc>.from(
            map["docs"].map((x) => DocDetailsDoc.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": docs.map((x) => x.toMap()).toList(),
      };
}

class DocDetailsDoc {
  String key;
  String title;
  List<String> authorName;
  Editions editions;

  DocDetailsDoc({
    required this.key,
    required this.title,
    required this.authorName,
    required this.editions,
  });

  factory DocDetailsDoc.fromMap(Map<String, dynamic> map) => DocDetailsDoc(
        key: map["key"],
        title: map["title"],
        authorName: List<String>.from(map["author_name"].map((x) => x)),
        editions: Editions.fromMap(map["editions"]),
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "title": title,
        "author_name": authorName,
        "editions": editions.toMap(),
      };
}

class Editions {
  int numFound;
  int start;
  bool numFoundExact;
  List<EditionsDoc> docs;

  Editions({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
  });

  factory Editions.fromMap(Map<String, dynamic> map) => Editions(
        numFound: map["numFound"],
        start: map["start"],
        numFoundExact: map["numFoundExact"],
        docs: List<EditionsDoc>.from(
            map["docs"].map((x) => EditionsDoc.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": docs.map((x) => x.toMap()).toList(),
      };
}

class EditionsDoc {
  String key;
  String title;
  List<String> language;
  String ebookAccess;

  EditionsDoc({
    required this.key,
    required this.title,
    required this.language,
    required this.ebookAccess,
  });

  factory EditionsDoc.fromMap(Map<String, dynamic> map) => EditionsDoc(
        key: map["key"],
        title: map["title"],
        language: List<String>.from(map["language"].map((x) => x)),
        ebookAccess: map["ebook_access"],
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "title": title,
        "language": language,
        "ebook_access": ebookAccess,
      };
}
