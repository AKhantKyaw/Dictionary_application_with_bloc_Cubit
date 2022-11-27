import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dictionaryappwith_bloc/Controller/Reposity/bookmarkrepo.dart';
import 'package:dictionaryappwith_bloc/LoginService/loginservice.dart';
import 'package:dictionaryappwith_bloc/View/DictionaryResult/dictionary_resultscreen.dart';
import 'package:flutter/material.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffb7883),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xfffb7883),
        title: const Text("BookMarks"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(UserAuthentication.auth.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = streamSnapshot.data!.docs[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => DictionaryScreen(
                                    userquery: data['title']))));
                      },
                      trailing: IconButton(
                          onPressed: () {
                            BookMarkRepo.deleteEntery(data.id,
                                UserAuthentication.auth.currentUser!.uid);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      title: Text(
                        data['title'],
                      ),
                      subtitle: Text(data['word']),
                    );
                  });
            }
            if (streamSnapshot.hasError) {
              return const Text("No Search data\n try again");
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.redAccent,
            ));
          },
        ),
      ),
    );
  }
}
