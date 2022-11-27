

import 'package:bloc/bloc.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/dictionary_error_repo.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/dictionarysuccess_repo.dart';
import 'package:dictionaryappwith_bloc/Model/dictionary_model.dart';
import 'package:dictionaryappwith_bloc/Model/error_model.dart';
import 'package:meta/meta.dart';
part 'dictionary_success_state.dart';

class DictionarySuccessCubit extends Cubit<DictionarySuccessState> {
  final DictionarySuccessRepo successRepo;
  final ErrorRepo errorRepo;
  DictionarySuccessCubit(this.successRepo, this.errorRepo)
      : super(DictionarySuccessInitial());
  void getUserinput(String value) {
    emit(DictionarySuccessInitial());
    successRepo
        .getDictionary(value)
        .then((val) => emit(DictionarySuccessfull(val)))
        .catchError((e) =>
            errorRepo.getError(value).then((e) => emit(Dictionaryfail(e))));
  }
}
