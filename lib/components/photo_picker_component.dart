import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/label_text_component.dart';

class PhotoPickerComponent extends StatelessWidget {
  PhotoPickerComponent(
      {Key? key, this.onPress, required this.text, required this.imagePath})
      : super(key: key);
  final Function()? onPress;
  final String text;
  final File? imagePath;

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
            child: LabelTextComponent(
                text: text, color: Colors.black, padding: 8.0),
          ),
          InkWell(
            onTap: onPress,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: imagePath != null
                  ? Container(
                height: 120.0,
                width: 120.0,
                    child: Image.file(
                        imagePath!,
                        fit: BoxFit.fill,
                      ),
                  )
                  : Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 70,
                        color: Colors.grey,
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
