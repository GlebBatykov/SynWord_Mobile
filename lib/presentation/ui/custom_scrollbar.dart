import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  final ScrollController? controller;

  final Widget child;

  final double crossAxisMargin;

  const CustomScrollbar(
      {Key? key,
      this.controller,
      required this.child,
      this.crossAxisMargin = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
        thumbColor: Colors.black.withOpacity(0.7),
        thumbVisibility: true,
        thickness: 1,
        crossAxisMargin: crossAxisMargin,
        controller: controller,
        child: child);
  }
}
