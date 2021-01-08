part of 'crop_cubit.dart';

@immutable
abstract class CropedState {
  final bool isPostArlet;
  final ICrop crop;

  CropedState({this.crop, this.isPostArlet});
}

class CropInitial extends CropedState {
  final bool isPostArlet;
  final ICrop crop;
  CropInitial({
    this.isPostArlet,
    this.crop,
  });
}
