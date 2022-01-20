import 'package:flutter/material.dart';
class TextFieldComponent extends StatelessWidget {
  TextFieldComponent({
    Key? key,
    required this.hintText,
    this.maxLines = 1,
    required this.errorText,
    this.textInputType = TextInputType.text,
    this.icon,
    this.isVisible = false,
   required this.controller,
    this.onPress,
  }) : super(key: key);
  final String hintText;
  final int maxLines;
  final String errorText;
  final IconData? icon;
  final bool isVisible;
  final Function()? onPress;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.1-55, ),
      child: TextFormField(
        maxLines: maxLines,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        controller: controller,
        obscureText: isVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(icon: Icon(icon), onPressed:onPress,),
          labelText:  hintText,
          labelStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
          contentPadding: EdgeInsets.all(10),
        ),
        validator: (value) => value!.trim().isEmpty ? errorText : null,
      ),
    );
  }
}