import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DropDownButtonViewPod<T> extends StatelessWidget {
  final List<T> itemsList;
  final IconData? icon;
  final dynamic value;
  final String? hintText;
  final void Function(T) onChangedData;

  const DropDownButtonViewPod(
      {Key? key,
      this.itemsList = const [],
      this.icon,
      this.value,
      required this.hintText,
      required this.onChangedData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 35,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          color: Colors.transparent,
          border: NeumorphicBorder(
            color: Colors.black87,
            width: 0.8,
          ),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(0)),
          depth: -4,
          lightSource: LightSource.topLeft,
        ),
        child: DropdownButtonFormField<T>(
          isExpanded: true,
          autovalidate: true,
          decoration:
              InputDecoration(contentPadding: EdgeInsets.only(bottom: 10)),
          dropdownColor: Colors.white,
          onChanged: (value) {
            onChangedData(value!);
          },
          items: itemsList
              .map((label) => DropdownMenuItem(
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        label.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    )),
                    value: label,
                  ))
              .toList(),
          hint: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              hintText.toString(),
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}
