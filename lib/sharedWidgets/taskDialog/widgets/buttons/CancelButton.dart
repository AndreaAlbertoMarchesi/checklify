import 'package:flutter/cupertino.dart';

import '../../../DialogButton.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogButton(
      context: context,
      onPressed: () => Navigator.pop(context),
      text: 'cancel',
    );
  }
}
