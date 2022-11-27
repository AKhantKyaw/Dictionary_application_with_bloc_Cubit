import 'package:dictionaryappwith_bloc/Component/textfileconstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Setting'),
        centerTitle: true,
 backgroundColor: const Color(0xfffb7883),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light/Night Mood",
                  style: Styleconstant.homenamestyle,
                ),
                FlutterSwitch(
                    width: 60.0,
                    height: 30.0,
                    valueFontSize: 25.0,
                    toggleSize: 30.0,
                    value: status,
                    borderRadius: 15.0,
                    padding: 5.0,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
