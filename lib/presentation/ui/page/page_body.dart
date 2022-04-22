import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  final Widget? child;

  final EdgeInsets? padding;

  const PageBody({Key? key, this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
