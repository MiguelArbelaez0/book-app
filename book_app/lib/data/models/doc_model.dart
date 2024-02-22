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

  factory DocModel.fromMap(Map<String, dynamic> map) {
    return DocModel(
      coverI: map['cover_i'] as int,
      hasFulltext: map['has_fulltext'] as bool,
      editionCount: map['edition_count'] as int,
      title: map['title'] as String,
      authorName: List<String>.from(map['author_name'].map((x) => x as String)),
      firstPublishYear: map['first_publish_year'] as int,
      key: map['key'] as String,
      ia: List<String>.from(map['ia'].map((x) => x as String)),
      authorKey: List<String>.from(map['author_key'].map((x) => x as String)),
      publicScanB: map['public_scan_b'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cover_i': coverI,
      'has_fulltext': hasFulltext,
      'edition_count': editionCount,
      'title': title,
      'author_name': authorName,
      'first_publish_year': firstPublishYear,
      'key': key,
      'ia': ia,
      'author_key': authorKey,
      'public_scan_b': publicScanB,
    };
  }
}
