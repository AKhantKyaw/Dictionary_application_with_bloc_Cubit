
import 'package:bloc/bloc.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/autofill_repo.dart';
import 'package:dictionaryappwith_bloc/Model/datamuse_model.dart';
import 'package:meta/meta.dart';
part 'autocompletecubit_state.dart';

class AutocompleteCubit extends Cubit<AutocompletecubitState> {
  final Reposity reposity;
  AutocompleteCubit(this.reposity) : super(AutocompletecubitInitial());
  void getdata(String value) {
    emit(AutocompletecubitInitial());
    reposity
        .autoFillquery(value)
        .then((e) => emit(AutocompleteSuccess(e)))
        .catchError((a) => emit(Autocompletefail('This is Error')));
  }
}
