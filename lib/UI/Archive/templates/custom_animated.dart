//This is a class for default animated box.
//Example call:
//
// import 'package:flutter/material.dart';

// customAnimatedBox(
//   height:100,
//   Color:Colors.red,
//   child:Container(child: Text("Hello"),),)

//Creates an animated box with the given properties and child with easyinout and duration 200ms

import 'package:flutter/material.dart';

Widget customAnimatedBox({
  double? width,
  double? height,
  BoxDecoration? decoration,
  Widget? child,
  Duration? duration,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  Clip? clipBehavior,
}) =>
    AnimatedContainer(
      duration: duration ?? const Duration(milliseconds: 0),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: decoration,
      margin: margin,
      padding: padding,
      clipBehavior: clipBehavior ?? Clip.none,
      child: child,
    );
