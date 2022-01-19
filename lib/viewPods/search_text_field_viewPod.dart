import 'package:flutter/material.dart';
class SearchTextFieldViewPod extends StatelessWidget {
  SearchTextFieldViewPod({
    Key? key,
    this.hintText,
    this.maxLines = 1,
    this.errorText,
    this.textInputType = TextInputType.text,
    this.icon,
    this.isVisible = false,
   required this.controller,
    this.onPress,
  }) : super(key: key);
  final String? hintText;
  final int? maxLines;
  final String? errorText;
  final IconData? icon;
  final bool isVisible;
  final Function()? onPress;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 42,
      margin: EdgeInsets.only(bottom: size.height * 0.1-60, ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: TextFormField(
        maxLines: maxLines,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        controller: controller,
        obscureText: isVisible,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
              minHeight: 5,
              minWidth: 5
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(icon: Icon(icon), onPressed:onPress,),
          isDense: true,
          contentPadding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
        ),
        validator: (value) => value!.trim().isEmpty ? errorText : null,
      ),
    );
  }
}