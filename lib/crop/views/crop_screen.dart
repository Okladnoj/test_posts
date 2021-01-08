import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/model/model_crop.dart';
import '../posts.dart';

class CorpScreen extends StatelessWidget {
  final ICrop crop;

  const CorpScreen({
    Key key,
    @required this.crop,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SafeArea(
          child: Stack(
        alignment: Alignment(0, 0),
        children: [
          Container(
            child: Image.file(
              crop.file,
              fit: BoxFit.fitWidth,
            ),
          ),
          CropFrame(
            crop: crop,
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    actionAfterCrop(
                      onTap: () {
                        BlocProvider.of<CropCubit>(context).cropCansel();
                      },
                      lable: 'Отмена',
                    ),
                    actionAfterCrop(
                      onTap: () {
                        BlocProvider.of<CropCubit>(context).cropAply(crop);
                      },
                      lable: 'Сохранить',
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  GestureDetector actionAfterCrop({Function onTap, String lable}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment(0, 0),
        color: Color(0xFF212528),
        width: 124,
        height: 42,
        child: Text(
          lable,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

class CropFrame extends StatefulWidget {
  final ICrop crop;

  const CropFrame({Key key, this.crop}) : super(key: key);
  @override
  _CropFrameState createState() => _CropFrameState();
}

class _CropFrameState extends State<CropFrame> {
  double _originX;
  double _originY;
  double _width;
  double _height;
  ICrop _crop;
  @override
  void initState() {
    _crop = widget.crop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, snapshot) {
      double maxWidth = snapshot.maxWidth;
      double maxHeight = snapshot.maxHeight;
      double _koef = maxWidth / _crop.width;
      _originX = _originX ?? 0;
      _originY = _originY ?? (maxHeight / 2 - _crop.height * _koef / 2);
      _width = _width ?? _crop.width * _koef;
      _height = _height ?? _crop.height * _koef;
      _crop
        ..height = _height.i
        ..width = _width.i
        ..originX = _originX.i
        ..originY = _originY.i;
      return Container(
        width: maxWidth,
        height: maxHeight,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: maxWidth,
                  height: _originY,
                  decoration: shadowDecoration,
                )),
            Positioned(
                left: 0,
                top: _height + _originY,
                child: Container(
                  width: maxWidth,
                  height: maxHeight - (_height + _originY),
                  decoration: shadowDecoration,
                )),
            Positioned(
                left: _originX + _width,
                top: _originY,
                child: Container(
                  width: maxWidth - (_originX + _width),
                  height: _height,
                  decoration: shadowDecoration,
                )),
            Positioned(
                left: 0,
                top: _originY,
                child: Container(
                  width: _originX,
                  height: _height,
                  decoration: shadowDecoration,
                )),
            Positioned(
              left: _originX,
              top: _originY,
              child: Container(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  border: Border.all(width: 1, color: Color(0xFF667EEA)),
                ),
                child: _currentField(),
              ),
            ),
          ],
        ),
      );
    });
  }

  Expanded shadowField() => Expanded(child: Container(color: Color(0x63FF0000)));

  Widget _currentField() => Column(
        children: [
          _rowTop(),
          _rowCentr(),
          _rowBotom(),
        ],
      );

  Widget _rowTop() => Expanded(
        child: Row(children: [_cellGird(_dragTopLeft), _cellGird(_dragTop), _cellGird(_dragTopRight)]),
      );
  Widget _rowCentr() => Expanded(
        child: Row(children: [_cellGird(_dragLeft), _cellGird(_dragCentr), _cellGird(_dragRight)]),
      );
  Widget _rowBotom() => Expanded(
        child: Row(children: [_cellGird(_bottomTopLeft), _cellGird(_dragBottom), _cellGird(_bottomTopRight)]),
      );

  Expanded _cellGird([Function(Offset globalPosition) dragFunction]) => Expanded(
          child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          dragFunction(details.globalPosition);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
            border: Border.all(width: 0.5, color: Color(0xA0667EEA)),
          ),
        ),
      ));

  _dragTopLeft(Offset globalPosition) {
    double dX = globalPosition.dx;
    double dY = globalPosition.dy;
    setState(() {
      _width += (_originX - dX);
      _height += (_originY - dY);
      _originX = dX;
      _originY = dY;
    });
  }

  _dragTopRight(Offset globalPosition) {
    double dX = globalPosition.dx;
    double dY = globalPosition.dy;
    setState(() {
      _width -= (_originX + _width - dX);
      _height += (_originY - dY);
      _originY = dY;
    });
  }

  _bottomTopLeft(Offset globalPosition) {
    double dX = globalPosition.dx;
    double dY = globalPosition.dy;
    setState(() {
      _width += (_originX - dX);
      _height -= (_originY + _height - dY);
      _originX = dX;
    });
  }

  _bottomTopRight(Offset globalPosition) {
    double dX = globalPosition.dx;
    double dY = globalPosition.dy;
    setState(() {
      _width -= (_originX + _width - dX);
      _height -= (_originY + _height - dY);
    });
  }

  _dragTop(Offset globalPosition) {
    double dY = globalPosition.dy;
    setState(() {
      _height += (_originY - dY);
      _originY = dY;
    });
  }

  _dragRight(Offset globalPosition) {
    double dX = globalPosition.dx;
    setState(() {
      _width -= (_originX + _width - dX);
    });
  }

  _dragBottom(Offset globalPosition) {
    double dY = globalPosition.dy;
    setState(() {
      _height -= (_originY + _height - dY);
    });
  }

  _dragLeft(Offset globalPosition) {
    double dX = globalPosition.dx;
    setState(() {
      _width += (_originX - dX);
      _originX = dX;
    });
  }

  _dragCentr(Offset globalPosition) {
    double dX = globalPosition.dx;
    double dY = globalPosition.dy;
    setState(() {
      _originX = dX - _width / 2;
      _originY = dY - _height / 2;
    });
  }
}

extension EDouble on double {
  int get i => this?.toInt();
}

const shadowDecoration = BoxDecoration(
  color: Color(0x9A232035),
);
