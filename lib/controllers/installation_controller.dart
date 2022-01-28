import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/models/installationDetailVO.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class InstallationController extends GetxController {
  var macIdController = TextEditingController();
  var deviceIdController = TextEditingController();
  var fiberUsageController = TextEditingController();
  var imageONU;
  var imageODB;
  var imageAcceptForm;
  var source = ImageSource.camera;
  var imagePicker;
  final readData = GetStorage();
  var installationDetail = InstallationDetails().obs;
  var isLoading = false.obs;



  void fetchInstallationDetail(String profileID){
    isLoading(true);
    RestApi.getInstallationDetail(readData.read(TOKEN),
        readData.read(UID),profileID).then((value) => {
      if(value.status == 'Success'){
        installationDetail.value = value.details!,
        isLoading(false)
      }
      else {
        isLoading(false)
      }

    });
  }

  @override
  void onInit() {
    imagePicker = new ImagePicker();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapONU() {
    imageFromGallery('onu');
  }

  void onTapODB() {
    imageFromGallery("odb");
  }

  void onTapAcceptForm() {
    imageFromGallery("accept");
  }

  void imageFromGallery(String tapStatus) async{
    XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, preferredCameraDevice: CameraDevice.front);

    if(image!=null){
      if(tapStatus == 'onu'){
        imageONU =  File(image.path);
        update();
        debugPrint('onuImagePath${imageONU.toString()}');
      }
      else if(tapStatus == 'odb')
        {
          imageODB =  File(image.path);
          update();
          debugPrint('odbImagePath${imageODB.toString()}');
        }
      else {
        imageAcceptForm =  File(image.path);
        update();
        debugPrint('acceptImagePath${imageAcceptForm.toString()}');
      }
    }

  }


}

