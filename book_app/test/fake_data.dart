import 'package:book_app/data/models/document_model.dart';
import 'package:book_app/data/models/search_result_model.dart';

SearchResult searchResultFakeNoData =
    SearchResult(start: 1, numFound: 3, docs: []);

SearchResult searchResultfakeWithData =
    SearchResult(start: 1, numFound: 3, docs: [
  Document(
      titleSuggest: "",
      editionKey: [""],
      coverId: 2,
      isbn: [""],
      hasFulltext: false,
      authorName: [""],
      contributor: [""],
      authorKey: [""],
      firstPublishYear: 2002,
      title: "",
      publisher: [""],
      language: [""]),
  Document(
      titleSuggest: "",
      editionKey: [""],
      coverId: 2,
      isbn: [""],
      hasFulltext: false,
      authorName: [""],
      contributor: [""],
      authorKey: [""],
      firstPublishYear: 2002,
      title: "",
      publisher: [""],
      language: [""])
]);
Document documentFake = Document(
  titleSuggest: "",
  editionKey: [""],
  coverId: 12,
  isbn: [""],
  hasFulltext: false,
  authorName: [""],
  contributor: [""],
  authorKey: [""],
  firstPublishYear: 1999,
  title: "",
  publisher: [""],
  language: [""],
);

List<Document> fakeList = [];
