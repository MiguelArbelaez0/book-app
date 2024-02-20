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

  factory DocDetails.fromJson(Map<String, dynamic> json) => DocDetails(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<DocDetailsDoc>.from(
            json["docs"].map((x) => DocDetailsDoc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
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

  factory DocDetailsDoc.fromJson(Map<String, dynamic> json) => DocDetailsDoc(
        key: json["key"],
        title: json["title"],
        authorName: List<String>.from(json["author_name"].map((x) => x)),
        editions: Editions.fromJson(json["editions"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "author_name": List<dynamic>.from(authorName.map((x) => x)),
        "editions": editions.toJson(),
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

  factory Editions.fromJson(Map<String, dynamic> json) => Editions(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<EditionsDoc>.from(
            json["docs"].map((x) => EditionsDoc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
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

  factory EditionsDoc.fromJson(Map<String, dynamic> json) => EditionsDoc(
        key: json["key"],
        title: json["title"],
        language: List<String>.from(json["language"].map((x) => x)),
        ebookAccess: json["ebook_access"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "language": List<dynamic>.from(language.map((x) => x)),
        "ebook_access": ebookAccess,
      };
}
