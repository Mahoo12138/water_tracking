import 'package:flutter/material.dart';
import 'package:water_tracking/foundation/extensions/context_ext.dart';

class HorizontalBreak extends StatelessWidget {
  const HorizontalBreak(
      {this.padding = const EdgeInsetsDirectional.symmetric(vertical: 10),
      this.color,
      super.key});
  final EdgeInsetsDirectional padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      height: 2,
      decoration: BoxDecoration(
        color: color ?? context.getColor("dividerColor"),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
      ),
    );
  }
}