
import 'package:dictionaryappwith_bloc/Controller/BlocproviderServices/Autofill_bloc_Cubit_provider/cubit/autocompletecubit_cubit.dart';
import 'package:dictionaryappwith_bloc/Controller/BlocproviderServices/Dictionary_success_Cubit_provider/cubit/dictionary_success_cubit.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/autofill_repo.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/dictionary_error_repo.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/dictionarysuccess_repo.dart';
import 'package:dictionaryappwith_bloc/Controller/Services/datamouseservices.dart';
import 'package:dictionaryappwith_bloc/Controller/Services/dictionaryservices.dart';
import 'package:dictionaryappwith_bloc/Controller/userperfes.dart';
import 'package:dictionaryappwith_bloc/View/SplashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AutocompleteCubit>(
          create: (context) => AutocompleteCubit(Reposity(
                AutofillServices(),
              ))),
      BlocProvider<DictionarySuccessCubit>(
          create: (context) => DictionarySuccessCubit(
              DictionarySuccessRepo(DictionaryService()),
              ErrorRepo(ErrorService()))),
      BlocProvider<UserAuthCubit>(create: (context) => UserAuthCubit())
    ],
    child:  const MaterialApp(
      // theme: AppTheme.lighttheme,
      // darkTheme: AppTheme.darktheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}
