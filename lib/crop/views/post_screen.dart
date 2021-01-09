import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_posts/crop/cubit/model/model_crop.dart';

import '../../settings/settings.dart';
import 'components/card_image.dart';

import '../posts.dart';

import 'components/components.dart';

class PostScreen extends StatelessWidget {
  final ICrop crop;

  const PostScreen({
    Key key,
    @required this.crop,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Container(
        decoration: kBoxDecorationMainScreen,
        child: SafeArea(
            child: Stack(
          alignment: Alignment(0, 0),
          children: [
            ListView(
              children: [
                CardImage(modelICrop: crop),
                AddDescriptToPost(
                  crop: crop,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                )
              ],
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
                        lable: 'Cansel',
                      ),
                      actionAfterCrop(
                        onTap: () {
                          BlocProvider.of<CropCubit>(context).onPost(crop);
                        },
                        lable: 'Send Post',
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

class AddDescriptToPost extends StatefulWidget {
  final ICrop crop;

  const AddDescriptToPost({Key key, this.crop}) : super(key: key);
  @override
  _AddDescriptToPostState createState() => _AddDescriptToPostState();
}

class _AddDescriptToPostState extends State<AddDescriptToPost> {
  ICrop crop;
  @override
  void initState() {
    crop = widget.crop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        fieldDecoration(
          TextFormField(
            minLines: 1,
            maxLines: 2,
            style: kTextStyleTitleMainScreen,
            decoration: InputDecoration(labelText: 'Enter post Title'),
            onChanged: (value) {
              crop.title = value;
            },
          ),
        ),
        fieldDecoration(
          TextFormField(
            style: kTextStyleCreateRecord,
            minLines: 3,
            maxLines: 50,
            decoration: InputDecoration(labelText: 'Enter post Content'),
            onChanged: (value) {
              crop.content = value;
            },
          ),
        ),
      ],
    );
  }

  Padding fieldDecoration(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: gBoxDecorationCreateRecord,
        child: child,
      ),
    );
  }
}
