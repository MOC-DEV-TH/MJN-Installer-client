import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/controllers/page_argument_controller.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  BottomNavigationBarComponent(
      {Key? key, required this.argumentData, required this.onChangedData})
      : super(key: key);
  late String argumentData;
  final void Function(String) onChangedData;

  @override
  Widget build(BuildContext context) {
    debugPrint("ArgumentData${argumentData}");
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  PageArgumentController.to.updateArgumentData(INSTALLATION);
                  onChangedData(INSTALLATION);
                },
                child: Container(
                  padding: EdgeInsets.only(right: 1, top: 10),
                  height: 52,
                  width: 150,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: argumentData == INSTALLATION
                            ? Color(0xffFF5F1F)
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Installation',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.inbox,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 1,
                right: 2,
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
          Stack(
            children: [
              InkWell(
                onTap: () {
                  PageArgumentController.to.updateArgumentData(SERVICE_TICKET);
                  onChangedData(SERVICE_TICKET);
                },
                child: Container(
                  padding: EdgeInsets.only(right: 1, top: 10),
                  height: 52,
                  width: 150,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: argumentData == SERVICE_TICKET
                            ? Color(0xffFF5F1F)
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Service Ticket',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.inbox,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 1,
                right: 2,
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
        ],
      ),
    );
  }
}
