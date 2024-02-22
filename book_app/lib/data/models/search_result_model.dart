import 'package:book_app/domain/entitis/doc_entiti.dart';
import 'package:book_app/domain/entitis/search_result_entiti.dart';

import 'doc_model.dart';

class SearchResulthModel {
  SearchResulthModel({
    required this.start,
    required this.numFound,
    required this.docs,
  });

  final int start;
  final int numFound;
  final List<DocModel> docs;

  factory SearchResulthModel.fromMap(Map<String, dynamic> map) {
    return SearchResulthModel(
      start: map['start'] as int,
      numFound: map['num_found'] as int,
      docs: List<DocModel>.from(
          map['docs'].map((x) => DocModel.fromMap(x as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'num_found': numFound,
      'docs': docs.map((x) => x.toMap()).toList(),
    };
  }
}
