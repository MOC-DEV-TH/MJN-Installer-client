import 'package:flutter/material.dart';
class LabelTextComponent extends StatelessWidget {
  LabelTextComponent({
    Key? key,
    required this.text,
    required this.color,
    required this.padding,
  }) : super(key: key);

  final String text;
  final Color color;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(padding),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color:color,
            decoration: TextDecoration.none),
      ),
    );
  }
}
