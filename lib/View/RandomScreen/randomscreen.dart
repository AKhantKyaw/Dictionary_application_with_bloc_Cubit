import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  getrandomword() {
    _suggestions.addAll(generateWordPairs().take(100));
    print(_suggestions.length);
  }

  @override
  void initState() {
    getrandomword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffb7883),
      appBar: AppBar(
        title: const Text('Random Word'),
        elevation: 0,
        backgroundColor: const Color(0xfffb7883),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: ListView.builder(
          itemCount: _suggestions.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            if (index.isOdd) return const Divider();

            return _buildRow(_suggestions[index], context);
          },
        ),
      ),
    );
  }
}

Widget _buildRow(WordPair pair, context) {
  return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 18, color: Colors.teal),
      ));
}
