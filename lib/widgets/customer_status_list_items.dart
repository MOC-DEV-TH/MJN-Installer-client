import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';
class CustomerStatusListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customerInfoLabel,
            middleLabel,
            customerInfoData,
            verticalDivider,
            InkWell(
              onTap: ()=>Get.toNamed(CUSTOMER_DETAIL),
                child: labelView)
          ],
        ),
      ),
    );
  }

  final customerInfoLabel = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Customer Name',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Customer Ph No.',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Township',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final middleLabel = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final customerInfoData = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Mr Jame',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '09-99999999',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Hlaing',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final verticalDivider = Container(
    height: 40,
    width: 1,
    color: Colors.grey,
  );

  final labelView = Text(
    'View',
    style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: Colors.lightBlueAccent,
        decoration: TextDecoration.underline),
  );
}
