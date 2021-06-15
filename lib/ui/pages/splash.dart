import 'package:chilli/ui/constants.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          width: size.width,
          child: Center(
            child: Text(
              'ObooNy',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width*2,
              ),
            ),
          ),
        ),
    );
  }
}
