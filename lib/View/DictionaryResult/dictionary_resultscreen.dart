import 'package:audioplayers/audioplayers.dart';
import 'package:dictionaryappwith_bloc/Component/result_containerbox.dart';
import 'package:dictionaryappwith_bloc/Component/textfileconstant.dart';
import 'package:dictionaryappwith_bloc/Controller/BlocproviderServices/Dictionary_success_Cubit_provider/cubit/dictionary_success_cubit.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/bookmarkrepo.dart';
import 'package:dictionaryappwith_bloc/LoginService/loginservice.dart';
import 'package:dictionaryappwith_bloc/Model/bookmarks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key, required this.userquery}) : super(key: key);
  final String userquery;
  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    BlocProvider.of<DictionarySuccessCubit>(context)
        .getUserinput(widget.userquery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffb7883),
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        elevation: 0,
        backgroundColor: const Color(0xfffb7883),
        title: const Text(
          'Dictionary',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BlocBuilder<DictionarySuccessCubit, DictionarySuccessState>(
              builder: (context, state) {
            if (state is DictionarySuccessfull) {
              final userInput = state.userInputSuccess;
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: ListBody(
                      children: [
                        Center(
                          child: Text(
                            userInput[index].word,
                            style: Styleconstant.titleStyle,
                          ),
                        ),
                        Text(
                          userInput[index].phonetics.isEmpty
                              ? ''
                              : userInput[index].phonetics[0].text,
                          style: Styleconstant.resulttitle,
                        ),
                        Center(
                          child: Text(
                            '(${userInput[index].meanings[0].partOfSpeech})',
                            style: Styleconstant.resulttitle,
                          ),
                        ),
                        Text(
                          "Defination",
                          style: Styleconstant.resulttitle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          userInput[index]
                              .meanings[0]
                              .definitions[0]
                              .definition,
                          style: Styleconstant.namestyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Example",
                          style: Styleconstant.resulttitle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          userInput[index]
                              .meanings[0]
                              .definitions[0]
                              .example
                              .toString(),
                          style: Styleconstant.namestyle,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(text: userInput[index].word),
                                ).then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          "Text is copied to Clipboard ✌🏼"),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                  ),
                                );
                              },
                              child: const ResultContainerbox(
                                  usericon: Icon(Icons.copy),
                                  name: 'Copy',
                                  tootipname: 'Copy your Text'),
                            ),
                            GestureDetector(
                              onTap: () {
                                BookMarkRepo.userAddEntery(
                                        UserAuthentication
                                            .auth.currentUser!.uid,
                                        Bookmarks(
                                            title: userInput[index].word,
                                            word: userInput[index]
                                                    .phonetics
                                                    .isEmpty
                                                ? "No text"
                                                : userInput[index]
                                                    .phonetics[index]
                                                    .text))
                                    .then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          "Text is saved sucessful ✌🏼"),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                  ),
                                );
                                print("object");
                              },
                              child: const ResultContainerbox(
                                  usericon: Icon(Icons.bookmark_add_outlined),
                                  name: 'Save',
                                  tootipname: 'Save your Text'),
                            ),
                            InkWell(
                              onTap: () {
                                Share.share(
                                  'Check out the word ${userInput[index].word} in Dictionary app!',
                                  subject: 'Look what I made!',
                                );
                              },
                              child: const ResultContainerbox(
                                  usericon: Icon(Icons.share),
                                  name: 'Share',
                                  tootipname: 'Share your Text'),
                            ),
                            InkWell(
                              onTap: () async {
                                userInput[index].phonetics.isEmpty
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: const Text(
                                            "OH!No search url for this pronounciation 🫣"),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      ))
                                    : await audioPlayer.play(UrlSource(userInput[
                                                index]
                                            .phonetics[0]
                                            .audio
                                            .isEmpty
                                        ? 'https://api.dictionaryapi.dev/media/pronunciations/en/error-us.mp3'
                                        : userInput[index].phonetics[0].audio));
                              },
                              child: const ResultContainerbox(
                                  usericon: Icon(Icons.volume_up_outlined),
                                  name: 'Play',
                                  tootipname: 'Play pronounciation'),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (state is Dictionaryfail) {
              return Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 100,
                        child: Lottie.asset('images/76699-error.json')),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      state.errorModel.title,
                      style: Styleconstant.titleStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.errorModel.message,
                      style: Styleconstant.namestyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.errorModel.resolution,
                      style: Styleconstant.namestyle,
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: SpinKitPouringHourGlass(
                color: Colors.black,
              ),
            );
          }),
        ),
      ),
    );
  }
}
