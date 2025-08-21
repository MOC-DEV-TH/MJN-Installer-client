import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownButtonComponent<T> extends StatelessWidget {
  final List<T>? itemsList;
  final IconData? icon;
  final T? value;
  final String hintText;
  final void Function(T) onChangedData;
  final String Function(T)? itemToString;

  const DropDownButtonComponent({
    Key? key,
    this.itemsList = const [],
    this.icon,
    this.value,
    required this.hintText,
    required this.onChangedData,
    this.itemToString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 40,
      ),
      child: SafeArea(
        child: DropdownButtonFormField2<T>(
          isExpanded: true,
          // Remove isDense: false if not supported
          value: value,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // icon: Icon(
          //   icon ?? Icons.arrow_drop_down,
          //   color: Colors.black45,
          // ),
          // Set button style
          buttonStyleData: ButtonStyleData(
            height: 40,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black26),
              color: Colors.white,
            ),
          ),
          // Set dropdown style
          dropdownStyleData: DropdownStyleData(
            maxHeight: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            offset: const Offset(0, 4),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          items: itemsList
              ?.map((item) => DropdownMenuItem<T>(
            value: item,
            child: Center(
              child: Text(
                itemToString!(item),
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54, fontSize: 10),
              ),
            ),
          ))
              .toList(),
          onChanged: (val) {
            if (val != null) onChangedData(val);
          },
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
          hint: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              hintText,
              style: const TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}
