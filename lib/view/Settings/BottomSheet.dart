import 'package:checklist_app/model/AppState.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../home/dialogs/ImageDialog.dart';
import 'package:provider/provider.dart';

import 'Styles.dart';


class AppBottomSheet extends StatefulWidget {
  @override
  _AppBottomSheetState createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  PickedFile _image;
  final ImagePicker _imagePicker = ImagePicker();

  _imgFromGallery() async {
    PickedFile image = await _imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.account_circle_outlined),
            title: new Text(
                'Select from app avatar',
              style: TextStyle(
                fontSize: Styles.getFontSizeChildren(appState.size),
              ),
            ),
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (_) => ImageDialog()
              );
              Navigator.of(context).pop();
            },
          ),
          new ListTile(
            leading: new Icon(Icons.photo_library_outlined),
            title: new Text(
                'Choose existing photo',
              style: TextStyle(
                fontSize: Styles.getFontSizeChildren(appState.size),
              ),
            ),
            onTap: () async {
              await _imgFromGallery();
              appState.modifyPhoto(_image.path);
              Navigator.of(context).pop();
           },
          ),
        ],
      ),
    );
  }
}

