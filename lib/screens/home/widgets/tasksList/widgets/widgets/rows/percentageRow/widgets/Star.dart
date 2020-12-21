import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Icon(Icons.star, color: Colors.yellowAccent),
    );
  }
}
