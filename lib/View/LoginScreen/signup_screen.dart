import 'package:dictionaryappwith_bloc/Component/alartdialoag.dart';
import 'package:dictionaryappwith_bloc/Component/textfileconstant.dart';
import 'package:dictionaryappwith_bloc/LoginService/login_error.dart';
import 'package:dictionaryappwith_bloc/LoginService/loginservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  UserAuthentication userAuthentication = UserAuthentication();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _fbKey = GlobalKey<FormState>();
  bool _obscureText = true;
  toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fbKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "",
            style: Styleconstant.titleStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Please Sign Up",
                    style: Styleconstant.titleStyle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full name",
                          style: Styleconstant.namestyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your name";
                            }
                            {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Name",
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email",
                          style: Styleconstant.namestyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Email";
                            }
                            {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
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
                          controller: passwardController,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Passward';
                            }
                            {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
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
                              color: Colors.red,
                            ));
                        final status = await userAuthentication.createAccount(
                          email: emailController.text,
                          name: nameController.text,
                          password: passwardController.text,
                        );
                        if (status == AuthStatus.successful) {
                          Loader.hide();
                          showMyDialog(context, "Successful",
                              "please go back loginScreen\n login your account");
                        } else {
                          Loader.hide();
                          final error =
                              AuthExceptionHandler.generateErrorMessage(status);
                          showMyDialog(context, error, "please try again");
                        }
                      }
                    },
                    child: const Text('SIGN UP'),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xfffb7883))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a user?", style: Styleconstant.namestyle),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('LOGIN'))
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
