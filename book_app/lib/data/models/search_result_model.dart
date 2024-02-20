import 'doc_model.dart';

class SearchResulthModel {
  int start;
  int numFound;
  List<Doc> docs;

  SearchResulthModel({
    required this.start,
    required this.numFound,
    required this.docs,
  });

  factory SearchResulthModel.fromJson(Map<String, dynamic> json) =>
      SearchResulthModel(
        start: json["start"],
        numFound: json["num_found"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "num_found": numFound,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
      };
}
