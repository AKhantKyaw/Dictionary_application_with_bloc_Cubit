import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthCubit extends Cubit<bool> {
  UserAuthCubit() : super(false);
  bool islogin = false;
  setprefes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    islogin = await prefs.setBool('islogin', true);
    emit(islogin);
    return islogin;
  }

  getprefes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    islogin = prefs.getBool('islogin') ?? false;
    emit(islogin);
    return islogin;
  }

  removebool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
