import 'package:book_app/data/models/doc_model.dart';
import 'package:book_app/domain/entitis/doc_entiti.dart';

class SearchResultEntiti {
  int start;
  int numFound;
  List<DocModel> docs;

  SearchResultEntiti({
    required this.start,
    required this.numFound,
    required this.docs,
  });
}
