import 'package:flutter/material.dart';
class MycustomContainer extends StatelessWidget {
  final Color color;

  MycustomContainer({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ,
        borderRadius: BorderRadius.all(25),
      ),
    );
  }
}