import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final List<Widget> children;

  const BaseContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 302.0, vertical: 32.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 23.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(children: children),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xfff9d371),
              Color(0xfff47340),
              Color(0xffEF2F88),
              Color(0xff8843F2),
            ],
          ),
        ),
      ),
    );
  }
}
