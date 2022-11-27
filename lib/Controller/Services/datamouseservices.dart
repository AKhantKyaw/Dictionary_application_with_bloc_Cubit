import 'dart:io';

import 'package:dictionaryappwith_bloc/Model/datamuse_model.dart';
import 'package:http/http.dart' as http;

class AutofillServices {
  Future<List<AutoCompleteModel>> getautofillservices(query) async {
    try {
      String baseURL = "https://api.datamuse.com/words?sp=";
      http.Response response;
      final url = Uri.parse("$baseURL$query*");
      response = await http.get(url);
      if (response.statusCode == 200) {
        var res = autoCompleteModelFromJson(response.body);
        print(response.statusCode);
        return res;
      } else {
        throw Exception('No Data Found');
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
