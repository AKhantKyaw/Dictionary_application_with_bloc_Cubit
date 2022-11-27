import 'package:flutter/material.dart';

class ResultContainerbox extends StatelessWidget {
  const ResultContainerbox({
    required this.usericon,
    required this.name,
    required this.tootipname,
    Key? key,
  }) : super(key: key);
  final Icon usericon;
  final String name;
  final String tootipname;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xfffcd770),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(height: 40, child: usericon),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
