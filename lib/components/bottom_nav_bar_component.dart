import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(right: 1, top: 10),
                height: 52,
                width: 150,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
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
              Container(
                padding: EdgeInsets.only(right: 1, top: 10),
                height: 52,
                width: 150,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: Color(0xffFF5F1F),
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
