class Doc {
  int coverI;
  bool hasFulltext;
  int editionCount;
  String title;
  List<String> authorName;
  int firstPublishYear;
  String key;
  List<String> ia;
  List<String> authorKey;
  bool publicScanB;

  Doc({
    required this.coverI,
    required this.hasFulltext,
    required this.editionCount,
    required this.title,
    required this.authorName,
    required this.firstPublishYear,
    required this.key,
    required this.ia,
    required this.authorKey,
    required this.publicScanB,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        coverI: json["cover_i"],
        hasFulltext: json["has_fulltext"],
        editionCount: json["edition_count"],
        title: json["title"],
        authorName: List<String>.from(json["author_name"].map((x) => x)),
        firstPublishYear: json["first_publish_year"],
        key: json["key"],
        ia: List<String>.from(json["ia"].map((x) => x)),
        authorKey: List<String>.from(json["author_key"].map((x) => x)),
        publicScanB: json["public_scan_b"],
      );

  Map<String, dynamic> toJson() => {
        "cover_i": coverI,
        "has_fulltext": hasFulltext,
        "edition_count": editionCount,
        "title": title,
        "author_name": List<dynamic>.from(authorName.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "key": key,
        "ia": List<dynamic>.from(ia.map((x) => x)),
        "author_key": List<dynamic>.from(authorKey.map((x) => x)),
        "public_scan_b": publicScanB,
      };
}
