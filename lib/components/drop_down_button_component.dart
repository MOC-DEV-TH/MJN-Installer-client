import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DropDownButtonComponent<T> extends StatelessWidget {
  final List<T> itemsList;
  final IconData? icon;
  final dynamic value;
  final String? hintText;
  final void Function(T) onChangedData;

  const DropDownButtonComponent(
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
      child: DropdownButtonFormField2<T>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 40,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        items: itemsList
            .map((label) => DropdownMenuItem(
                  child: Center(
                      child: Text(
                    label.toString(),
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  ),
                  value: label,
                ))
            .toList(),
        // validator: (value) {
        //   if (value == null) {
        //     return 'Please select issue.';
        //   }
        // },
        onChanged: (value) {
          onChangedData(value!);
        },
        hint: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            hintText.toString(),
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
