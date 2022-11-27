import 'package:dictionaryappwith_bloc/Controller/Services/dictionaryservices.dart';
import 'package:dictionaryappwith_bloc/Model/dictionary_model.dart';

class DictionarySuccessRepo{
  final DictionaryService dictionaryService;
  DictionarySuccessRepo(this.dictionaryService);
    Future<List<DictionaryModel>> getDictionary(String query) async {
    final userInputquery = await dictionaryService.getdictionary(query);
    return userInputquery!;
  }
}