import 'package:flutter/cupertino.dart';

import '../../../DialogButton.dart';

class UpdateConfirmButton extends StatelessWidget {
  UpdateConfirmButton(this.onPressed);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogButton(
      context: context,
      onPressed: onPressed,
      text: 'update',
    );
  }
}
