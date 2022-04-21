import 'package:flutter/material.dart';

import '../button/rounded/rounded_back_button.dart';

class PageTitleBar extends StatelessWidget {
  final Widget? center;

  final Widget? right;

  final List<double>? ratio;

  PageTitleBar({Key? key, this.center, this.right, this.ratio})
      : super(key: key) {
    if (ratio != null && ratio!.length != 3) {
      throw Exception('If the ratio is set, it must contain 3 elements');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28, right: 28, top: 14, bottom: 14),
      child: LayoutBuilder(builder: ((context, constraints) {
        var width = constraints.maxWidth;

        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  width: width * (ratio != null ? ratio![0] : 0.33),
                  child: const RoundedBackButton()),
              Container(
                width: width * (ratio != null ? ratio![1] : 0.33),
                alignment: Alignment.center,
                child: center ?? Container(),
              ),
              Container(
                  width: width * (ratio != null ? ratio![2] : 0.33),
                  alignment: Alignment.centerRight,
                  child: right ?? Container())
            ]);
      })),
    );
  }
}
