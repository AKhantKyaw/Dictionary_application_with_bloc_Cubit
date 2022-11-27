
import 'dart:io';
import 'package:dictionaryappwith_bloc/Model/dictionary_model.dart';
import 'package:dictionaryappwith_bloc/Model/error_model.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  Future<List<DictionaryModel>?> getdictionary(String value) async {
    try {
      final url =
          Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/" + value);
      final http.Response response;
      response = await http.get(url);
      if (response.statusCode == 200) {
        var res = dictionaryModelFromJson(response.body);
        return res;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      print(e.toString());
      rethrow;
    } on FormatException catch (e) {
      print(e.toString());
      rethrow;
    } on HttpException catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}

class ErrorService {
  Future<ErrorModel> geterror(String value) async {
    final url =
        Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/" + value);
    final http.Response response;
    response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 404) {
      var res = errorModelFromJson(response.body);
      return res;
    } else {
      throw Exception('Search another word');
    }
  }
}
