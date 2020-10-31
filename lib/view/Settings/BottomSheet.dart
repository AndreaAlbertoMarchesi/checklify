import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(Icons.camera_alt_outlined),
              title: new Text('New photo'),
              onTap: () => {

              }),
          new ListTile(
            leading: new Icon(Icons.photo_library_outlined),
            title: new Text('Choose existing photo'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
