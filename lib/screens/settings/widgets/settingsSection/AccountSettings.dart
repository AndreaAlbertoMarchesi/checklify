import 'dart:io';
import 'package:checklist_app/screens/settings/widgets/dialogs/ModifyName.dart';
import 'package:checklist_app/sharedWidgets/TextStyles/AppTextDecoration.dart';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import '../BottomSheet.dart';

class AccountSettings extends StatelessWidget {
  final double radius = 50;
  final double iconSize = 30;
  final double distance = 10;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextDecoration("Account",
                  fontSize: settings.getFontSizeChildren(),
                  fontStyle: FontStyle.italic,
                  color: settings.getFont()),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Stack(alignment: Alignment.center, children: [
                    CircleAvatar(
                      backgroundImage: settings.isPhotoFromGallery
                          ? FileImage(File(settings.appUser.photoURL))
                          : AssetImage("${settings.appUser.photoURL}"),
                      backgroundColor: Colors.transparent,
                      radius: radius,
                      //background image
                    ),
                    Positioned(
                        top: -(iconSize + radius - 45),
                        right: -(radius - 50 + iconSize - distance),
                        bottom: iconSize,
                        left: radius,
                        child: Icon(
                          Icons.auto_awesome,
                          color: Colors.blue,
                          size: iconSize,
                        )),
                  ]),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.create_outlined),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                            child: AppTextDecoration(settings.appUser.userName,
                                fontSize: settings.getFontSizeChildren()),
                        )),
                      ],
                    ),
                  ),
                  onPressed: () {
                    openAddDialog(context);
                  },
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: settings.getColor()),
          bottom: BorderSide(color: settings.getColor()),
        )));
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return AppBottomSheet();
        });
  }

  void openAddDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ModifyName();
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 400),
    );
  }
}
