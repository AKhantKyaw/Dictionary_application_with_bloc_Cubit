import 'dart:async';
import 'package:dictionaryappwith_bloc/Controller/userperfes.dart';
import 'package:dictionaryappwith_bloc/View/HomeScreen/home_screen.dart';
import 'package:dictionaryappwith_bloc/View/LoginScreen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<UserAuthCubit>(context, listen: false).getprefes();
    });
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BlocProvider.of<UserAuthCubit>(context).islogin
                      ? const DictionaryApp()
                      : const LoginScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('images/login.json'),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Dictionary App".toUpperCase(),
            style: const TextStyle(
              color: Color.fromARGB(255, 169, 116, 17),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
