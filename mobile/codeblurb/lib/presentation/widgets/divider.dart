import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider({
    Key? key,
    this.direction = Axis.horizontal,
    this.mainAxisPadding = 0,
    this.crossAxisPadding = 0,
    this.color = Colors.black38,
    this.strokeWidth = 1,
    this.heightWhenVertical,
    this.widthWhenHorizontal,
  }) : super(key: key);

  final Axis direction;
  final double mainAxisPadding;
  final double crossAxisPadding;
  final double? heightWhenVertical;
  final double? widthWhenHorizontal;

  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: direction == Axis.horizontal ? 0 : crossAxisPadding,
        vertical: direction == Axis.horizontal ? crossAxisPadding : 0,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: direction == Axis.horizontal ? mainAxisPadding : 0,
          vertical: direction == Axis.horizontal ? 0 : mainAxisPadding,
        ),
        height: direction == Axis.horizontal
            ? strokeWidth
            : heightWhenVertical ?? double.infinity,
        width: direction == Axis.horizontal
            ? widthWhenHorizontal ?? double.infinity
            : strokeWidth,
        color: color,
      ),
    );
  }
}
