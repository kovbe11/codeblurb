import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    this.isLight = true,
  }) : super(key: key);

  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
          brightness: isLight ? Brightness.dark : Brightness.light),
      child: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor:
              AlwaysStoppedAnimation(isLight ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
