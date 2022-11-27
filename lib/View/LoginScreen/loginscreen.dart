import 'package:dictionaryappwith_bloc/Component/alartdialoag.dart';
import 'package:dictionaryappwith_bloc/Component/textfileconstant.dart';
import 'package:dictionaryappwith_bloc/Controller/userperfes.dart';
import 'package:dictionaryappwith_bloc/LoginService/login_error.dart';
import 'package:dictionaryappwith_bloc/LoginService/loginservice.dart';
import 'package:dictionaryappwith_bloc/View/HomeScreen/home_screen.dart';
import 'package:dictionaryappwith_bloc/View/LoginScreen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _fbKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwardcontroller = TextEditingController();
  UserAuthentication userAuthentication = UserAuthentication();
  bool _obscureText = true;

  toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fbKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "A-Z",
            style:
                TextStyle(fontSize: 22, color: Colors.black, shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ]),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: Styleconstant.namestyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Email";
                            }
                            {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: Styleconstant.namestyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          controller: passwardcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your passward";
                            }
                            {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  toggle();
                                },
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_fbKey.currentState!.validate()) {
                        Loader.show(context,
                            progressIndicator: const CupertinoActivityIndicator(
                              color: Colors.blue,
                            ));
                        final status = await userAuthentication.login(
                            email: namecontroller.text,
                            password: passwardcontroller.text);
                        if (status == AuthStatus.successful) {
                          Loader.hide();
                          BlocProvider.of<UserAuthCubit>(context).setprefes();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DictionaryApp()),
                              (route) => false);
                        } else {
                          Loader.hide();
                          final error =
                              AuthExceptionHandler.generateErrorMessage(status);
                          showMyDialog(context, error, "Please try again");
                        }
                      }
                    },
                    child: const Text('LOGIN'),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xfffb7883))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Need an account?",
                        style: Styleconstant.namestyle,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                          child: const Text('SIGN UP'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
