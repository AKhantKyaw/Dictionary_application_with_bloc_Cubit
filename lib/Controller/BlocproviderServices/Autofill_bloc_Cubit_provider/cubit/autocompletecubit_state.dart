part of 'autocompletecubit_cubit.dart';

@immutable
abstract class AutocompletecubitState {}

class AutocompletecubitInitial extends AutocompletecubitState {}

class AutocompleteSuccess extends AutocompletecubitState {
  final List<AutoCompleteModel> userInputword;
  AutocompleteSuccess(this.userInputword);
}

class Autocompletefail extends AutocompletecubitState {
  final String error;
  Autocompletefail(this.error);
}
