import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
          children: [
            Positioned(
              left: 2.0,
              top: 2.0,
              child: Icon(Icons.star, color: Colors.black45),
            ),
            Icon(Icons.star, color: Colors.yellowAccent)
          ],
      ),
    );
  }
}
