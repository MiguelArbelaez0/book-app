import '../../domain/entitis/doc_entiti.dart';

class DocModel extends DocEntiti {
  DocModel(
      {required super.coverI,
      required super.hasFulltext,
      required super.editionCount,
      required super.title,
      required super.authorName,
      required super.firstPublishYear,
      required super.key,
      required super.ia,
      required super.authorKey,
      required super.publicScanB});
  factory DocModel.fromJson(Map<String, dynamic> json) => DocModel(
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
