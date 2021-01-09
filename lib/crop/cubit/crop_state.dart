part of 'crop_cubit.dart';

@immutable
abstract class CropedState {
  final bool isPostArlet;
  final bool isCroped;
  final ICrop crop;

  CropedState({
    this.crop,
    this.isCroped,
    this.isPostArlet,
  });
}

class CropInitial extends CropedState {
  final bool isPostArlet;
  final bool isCroped;
  final ICrop crop;
  CropInitial({
    this.isPostArlet,
    this.isCroped = false,
    this.crop,
  });
}
