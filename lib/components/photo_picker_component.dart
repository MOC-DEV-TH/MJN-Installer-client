import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/label_text_component.dart';
class PhotoPickerComponent extends StatelessWidget {
  PhotoPickerComponent({
    Key? key,
    this.onPress,
   required this.text,
  }) : super(key: key);
  final Function()? onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: LabelTextComponent(text: text, color: Colors.black, padding: 8.0),
          ),

          InkWell(
            onTap: onPress,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(color: Colors.white,border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
                child: Icon(Icons.camera_alt_outlined,size: 70,color: Colors.grey,)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
