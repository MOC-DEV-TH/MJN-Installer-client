import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton2<T> extends StatelessWidget {
  final List<T> dropdownItems;
  final String? hintText;
  final T? value;
  final void Function(T) onChangedData;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;

  // Style Data classes instead of individual params:
  final ButtonStyleData? buttonStyleData;
  final IconStyleData? iconStyleData;
  final DropdownStyleData? dropdownStyleData;
  final MenuItemStyleData? menuItemStyleData;

  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;

  const CustomDropdownButton2({
    Key? key,
    required this.dropdownItems,
    this.hintText,
    required this.onChangedData,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.value,
    this.valueAlignment,
    this.buttonStyleData,
    this.iconStyleData,
    this.dropdownStyleData,
    this.menuItemStyleData,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: hintText == null
            ? null
            : Container(
          alignment: hintAlignment ?? Alignment.centerLeft,
          child: Text(
            hintText!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        items: dropdownItems
            .map(
              (item) => DropdownMenuItem<T>(
            value: item,
            child: Container(
              alignment: valueAlignment ?? Alignment.centerLeft,
              child: Text(
                item.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        )
            .toList(),
        value: value,
        onChanged: (val) {
          if (val != null) onChangedData(val);
        },
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: buttonStyleData ??
            ButtonStyleData(
              height: 40,
              width: 140,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black45),
              ),
              elevation: 4,
            ),
        iconStyleData: iconStyleData ??
            const IconStyleData(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              iconSize: 14,
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
            ),
        dropdownStyleData: dropdownStyleData ??
            DropdownStyleData(
              maxHeight: 200,
              width: 140,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              elevation: 8,
              offset: offset ?? Offset(0, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: scrollbarRadius ?? const Radius.circular(40),
                thickness:
                scrollbarThickness != null ? MaterialStateProperty.all(scrollbarThickness!) : null,
                thumbVisibility:
                scrollbarAlwaysShow != null ? MaterialStateProperty.all(scrollbarAlwaysShow!) : null,
              ),
            ),
        menuItemStyleData: menuItemStyleData ??
            const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 14),
            ),
        //dropdownOverButton: false,
      ),
    );
  }
}
