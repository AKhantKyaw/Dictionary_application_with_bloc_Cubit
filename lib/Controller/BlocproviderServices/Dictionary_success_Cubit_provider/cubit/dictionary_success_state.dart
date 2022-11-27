part of 'dictionary_success_cubit.dart';

@immutable
abstract class DictionarySuccessState {}

class DictionarySuccessInitial extends DictionarySuccessState {}

class DictionarySuccessfull extends DictionarySuccessState {
  final List<DictionaryModel> userInputSuccess;
  DictionarySuccessfull(this.userInputSuccess);
}

class Dictionaryfail extends DictionarySuccessState {
  final ErrorModel errorModel;
  Dictionaryfail(this.errorModel);
}
