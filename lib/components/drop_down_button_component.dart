import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DropDownButtonComponent<T> extends StatelessWidget {
  final List<dynamic>? itemsList;
  final List<dynamic>? installItemsList;
  final IconData? icon;
  final String? value;
  final String? hintText;
  final void Function(T) onChangedData;

  const DropDownButtonComponent(
      {Key? key,
      this.itemsList = const [],
      this.installItemsList = const [],
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
      child: SafeArea(
        child: DropdownButtonFormField2<dynamic>(
          isExpanded: true,
          isDense: false,
          itemHeight: 60,
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
          items:  itemsList
              !.map((label) => DropdownMenuItem(
                    child: Center(
                      child: Text(
                        label.name.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 10),
                      ),
                    ),
                    value: label.name,
                  ))
              .toList(),
          onChanged: (value) {
            onChangedData(value);
          },
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
