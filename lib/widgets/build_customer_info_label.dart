import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/label_text_component.dart';
class BuildCustomerInfoLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [customerLabel, middleLabel, customerLabelData],
    );
  }
  final customerLabelData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'xx xxx xxx xxx xxx', color: Colors.black, padding: 8.0),
    ],
  );

  final customerLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(
          text: 'User ID', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Customer Name', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Customer Phone', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Address', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Lat', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Long', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Type', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Topic', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Assigned Date', color: Colors.black, padding: 8.0),
    ],
  );

  final middleLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '- - -', color: Colors.black, padding: 8.0),
    ],
  );
}
