import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts.dart';

class ActionOpenDerictory extends StatelessWidget {
  final Widget child;

  const ActionOpenDerictory({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        BlocProvider.of<CropCubit>(context).coiseFile();
      },
    );
  }
}
