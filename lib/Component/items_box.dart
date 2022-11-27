
import 'package:dictionaryappwith_bloc/Component/textfileconstant.dart';
import 'package:flutter/material.dart';

class Itemsbox extends StatelessWidget {
  final String name;
  final String image;
  const Itemsbox({
    required this.name,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.white,
      elevation: 8,
      child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/$image'),
              Text(
                name,
                style: Styleconstant.homenamestyle,
              )
            ],
          )),
    );
  }
}
