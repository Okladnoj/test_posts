import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

import '../model/model_crop.dart';

Future<ICrop> gPpickFile() async {
  ICrop _cropImage;
  try {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      ImageProperties properties = await FlutterNativeImage.getImageProperties(file.path);
      _cropImage = CropImage.withPropertis(file, properties);

      /// _cropImage = await openArletCrop(context, _cropImage);
    } else {
      // User canceled the picker
    }
  } catch (e) {
    print('Don\'t open derictory');
    print(e);
  }
  return _cropImage;
}
