import 'dart:io';
import 'package:checklist_app/states/Settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../BottomSheet.dart';

class Avatar extends StatelessWidget {
  final double radius = 50;
  final double iconSize = 30;
  final double distance = 10;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Center(
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
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return AppBottomSheet();
        });
  }
}
