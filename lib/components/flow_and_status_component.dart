import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/controllers/page_argument_controller.dart';
import 'package:get/get.dart';

class FlowAndStatusComponent extends StatelessWidget {

  FlowAndStatusComponent({
    Key? key,
    this.text,
    this.color,
    this.padding,
    required this.status,
    required this.routeName,
    required this.icon,
    this.containerWidth,
    this.onPress,
    this.count,
    this.argumentData,
  }) : super(key: key);
  final String? text;
  final Function()? onPress;
  final Color? color;
  final double? padding;
  final double? containerWidth;
  final String status;
  final String routeName;
  final IconData icon;
  final String? count;
  final String? argumentData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        PageArgumentController.to.updateArgumentData(argumentData!),
        Get.toNamed(routeName),
      },
      child: Container(
        height: 170,
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
          ),
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Icon(
                  icon,
                  size: 80,
                ),
                Positioned(
                  top: 1,
                  right: 1,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Text(
                      "2",
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.yellow,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              status,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
