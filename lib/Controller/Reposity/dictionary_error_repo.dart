import 'package:dictionaryappwith_bloc/Controller/Services/dictionaryservices.dart';
import 'package:dictionaryappwith_bloc/Model/error_model.dart';
class ErrorRepo {
  final ErrorService errorService;
  ErrorRepo(this.errorService);
  Future<ErrorModel> getError(String query) async {
    final userInputerrer = await errorService.geterror(query);
    return userInputerrer;
  }
}
