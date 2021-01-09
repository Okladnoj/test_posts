import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'functions/pick_file.dart';
import 'functions/post_file.dart';
import 'model/model_crop.dart';

part 'crop_state.dart';

class CropCubit extends Cubit<CropedState> {
  CropCubit({CropedState state}) : super(CropInitial(isPostArlet: false));
  coiseFile() async {
    CropImage crop = await gPpickFile();
    if (crop?.file != null) {
      // gCropImage(crop?.file);
      emit(CropInitial(crop: crop, isPostArlet: true));
    }
  }

  cropCansel() {
    emit(CropInitial(isPostArlet: false));
  }

  cropAply(ICrop crop) async {
    crop.file = await cropImage(crop);
    emit(CropInitial(isPostArlet: true, isCroped: true, crop: crop));
  }

  onPost(ICrop crop) {
    emit(CropInitial(isPostArlet: false, isCroped: false, crop: crop));
    gPostCropFile(crop);
  }
}
