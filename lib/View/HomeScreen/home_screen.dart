import 'package:dictionaryappwith_bloc/Component/items_box.dart';
import 'package:dictionaryappwith_bloc/Component/textfileconstant.dart';
import 'package:dictionaryappwith_bloc/Controller/userperfes.dart';
import 'package:dictionaryappwith_bloc/View/LoginScreen/loginscreen.dart';
import 'package:dictionaryappwith_bloc/View/RandomScreen/randomscreen.dart';
import 'package:dictionaryappwith_bloc/View/SearchScreen/scarchscreen.dart';
import 'package:dictionaryappwith_bloc/View/Setting/bookmark_screen.dart';
import 'package:dictionaryappwith_bloc/View/Setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryApp extends StatefulWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  @override
  State<DictionaryApp> createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  Styleconstant styleconstant = Styleconstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffb7883),
      appBar: AppBar(
        backgroundColor: const Color(0xfffb7883),
        elevation: 0,
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                            height: 50,
                            child: Image.asset('images/dictionary.png')),
                      ),
                      const Text(
                        'DICTIONARY',
                        style: TextStyle(fontSize: 22, shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ]),
                      ),
                      PopupMenuButton(
                          color: Colors.white,
                          elevation: 2,
                          onSelected: (value) {
                            if (value == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingScreen()));
                            } else if (value == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BookmarksScreen()));
                            } else if (value == 3) {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xffF9EED9),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text("Log Out"),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                              'Are you sure to logout\nthis account?'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: Styleconstant.namestyle,
                                          )),
                                      TextButton(
                                          child: Text(
                                            'Ok',
                                            style: Styleconstant.namestyle,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<UserAuthCubit>(
                                                    context)
                                                .removebool();
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen()),
                                                (route) => false);
                                          }),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          icon: const Icon(Icons.more_vert),
                          tooltip: 'More',
                          itemBuilder: (context) {
                            return <PopupMenuEntry>[
                              const PopupMenuItem(
                                  value: 1, child: Text('Setting')),
                              const PopupMenuItem(
                                  value: 2, child: Text('BookMarks')),
                              const PopupMenuItem(
                                  value: 3, child: Text('Logout'))
                            ];
                          }),
                    ]),
              ),
            ),
            preferredSize: const Size.fromHeight(30)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(20))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                    child: const Itemsbox(
                      name: "Search",
                      image: 'icons8-search-64.png',
                    ),
                  ),
                  GestureDetector(
                      child: const Itemsbox(
                          name: 'History', image: 'icons8-history-64.png'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookmarksScreen()));
                      },
                      child: const Itemsbox(
                          name: 'BookMarks', image: 'icons8-bookmark-64.png')),
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RandomWord())),
                      child: const Itemsbox(
                          name: 'Random', image: 'icons8-dice-64.png'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
