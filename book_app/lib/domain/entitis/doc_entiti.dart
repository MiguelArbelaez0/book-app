class DocEntiti {
  final int coverI;
  final bool hasFulltext;
  final int editionCount;
  final String title;
  final List<String> authorName;
  final int firstPublishYear;
  final String key;
  final List<String> ia;
  final List<String> authorKey;
  final bool publicScanB;

  DocEntiti({
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
}
