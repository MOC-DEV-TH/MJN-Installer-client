import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InstallationDropDownController extends GetxController {
  var macIdController = TextEditingController();
  var deviceIdController = TextEditingController();
  var fiberUsageController = TextEditingController();
  var imageONU;
  var imageODB;
  var imageAcceptForm;
  var source = ImageSource.camera;
  var imagePicker;

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

