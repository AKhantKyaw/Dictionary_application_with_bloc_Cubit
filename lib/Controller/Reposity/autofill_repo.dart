
import 'package:dictionaryappwith_bloc/Controller/Services/datamouseservices.dart';
import 'package:dictionaryappwith_bloc/Model/datamuse_model.dart';

class Reposity{
  final AutofillServices autofillServices;
  Reposity(this.autofillServices);
  Future<List<AutoCompleteModel>> autoFillquery(String query) async {
    final userautofillquery = await autofillServices.getautofillservices(query);
    return userautofillquery;
  }
}
