import 'package:flutter/cupertino.dart';

import '../../../DialogButton.dart';

class AddConfirmButton extends StatelessWidget {
  AddConfirmButton(this.onPressed);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return DialogButton(
      context: context,
      onPressed: onPressed,
      text: 'add',
    );
  }
}
