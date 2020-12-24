import 'package:checklist_app/screens/settings/widgets/dialogs/ImageDialog.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AppBottomSheet extends StatefulWidget {
  @override
  _AppBottomSheetState createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  PickedFile _image;
  final ImagePicker _imagePicker = ImagePicker();

  _imgFromGallery() async {
    PickedFile image = await _imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: AppTextDecoration('Select from app avatar',
                fontSize: settings.getFontSizeChildren()),
            onTap: () async {
              await showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => ImageDialog(),
                animationType: DialogTransitionType.fade,
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 400),
              );
              Navigator.of(context).pop();
            },
          ),
          new ListTile(
            leading: new Icon(Icons.photo_library_outlined),
            title: AppTextDecoration('Choose existing photo',
                fontSize: settings.getFontSizeChildren()),
            onTap: () async {
              await _imgFromGallery();
              settings.modifyPhoto(_image.path);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
