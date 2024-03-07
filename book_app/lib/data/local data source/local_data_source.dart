import 'package:book_app/data/models/document_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  late final Document _document;

  late SharedPreferences _prefs;

  //se inicializa las preferncias
  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //get

  //set
}
