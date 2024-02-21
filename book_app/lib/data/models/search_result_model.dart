import 'package:book_app/domain/entitis/doc_entiti.dart';
import 'package:book_app/domain/entitis/search_result_entiti.dart';

import 'doc_model.dart';

class SearchResulthModel  extends SearchResultEntiti{
  SearchResulthModel({
    required super.start,
    required super.numFound,
    required super.docs,
  })
 

  factory SearchResulthModel.fromJson(Map<String, dynamic> json) =>
      SearchResulthModel(
        start: json["start"],
        numFound: json["num_found"],
        docs:
            List<DocModel>.from(json["docs"].map((x) => DocModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "num_found": numFound,
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
      };
}
