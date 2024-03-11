import 'dart:convert';
import 'package:book_app/data/models/document_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const documentKey = "document_key";

  Future<void> addBookToFavorites(Document documents) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteBooks = prefs.getStringList('favoriteBooks') ?? [];
    favoriteBooks.add(jsonEncode(documents.toJson()));
    await prefs.setStringList('favoriteBooks', favoriteBooks);
  }

  Future<List<Document>?> getFavoriteBooks() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(documentKey) != null) {
      List<String> favoriteBooks = prefs.getStringList('favoriteBooks') ?? [];
      return favoriteBooks
          .map((item) => Document.fromJson(jsonDecode(item)))
          .toList();
    }
    return null;
  }
}
