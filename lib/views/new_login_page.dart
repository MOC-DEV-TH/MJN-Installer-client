import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/button_component.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/views/home_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'my_location_page.dart';

// ignore: must_be_immutable
class NewLoginPage extends StatelessWidget {
  var userIdController = TextEditingController();
  var passwordController = TextEditingController();
  final writeData = GetStorage();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(int.parse(MJNColors.bgColor)),
        body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: screenHeight * 0.2,
                      child: Image(
                        image: AssetImage('assets/splash_screen_logo.png'),
                        width: 200,
                        height: 100,
                      )),
                  Center(
                    child: Container(
                      height: screenHeight * 0.6,
                      alignment: Alignment.center,
                      child: _buildWidget(),
                    ),
                  )
                ],
              ),
            )));
  }

  Widget _buildWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 130,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: Text(
                        'User ID:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: Text(
                        'Password:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ]),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    height: 40,
                    padding: EdgeInsets.only(bottom: 6),
                    margin: EdgeInsets.only(right: 27),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: userIdController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 27),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 35,
        ),

        ButtonComponent(text: 'Login',
          containerWidth: 120,
          padding: 10,
          color: Color(int.parse(MJNColors.buttonColor)),
          onPress
          :()=> Get.off(HomePage()),),

        // Padding(
        //   padding: EdgeInsets.only(bottom: 10),
        //   child: Container(
        //     child: ButtonTheme(
        //       height: 40,
        //       child: RaisedButton(
        //         child: Text('Login',
        //             style: TextStyle(color: Colors.white, fontSize: 18)),
        //         color: Color(int.parse(MJNColors.buttonColor)),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10)),
        //         onPressed: () {
        //           debugPrint('click');
        //           if (userIdController.text != '' ||
        //               passwordController.text != '') {
        //             Map<String, String> map = {
        //               'user_id': userIdController.value.text,
        //               'password': passwordController.value.text
        //             };
        //
        //             debugPrint('call api');
        //             RestApi.fetchSupportLogin(map).then((value) => {
        //                   Future.delayed(Duration.zero, () {
        //                     if (value.status == 'Success') {
        //                       writeData.write(SAVE_TIME, DateTime.now().minute);
        //
        //                       Get.off(() => MyLocation(value.token.toString()));
        //                     } else {
        //                       AppUtils.showErrorSnackBar(
        //                           "Fail", value.description ?? '');
        //                     }
        //                   })
        //                 });
        //           }
        //
        //           Get.off(HomePage());
        //         },
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 10,
        ),
        Text(
          'forget password',
          style: TextStyle(decoration: TextDecoration.underline),
        ),

      ],
    );
  }
}
