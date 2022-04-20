import 'package:flutter/cupertino.dart';

import '../button/rounded_back_button.dart';

class PageTitleBar extends StatelessWidget {
  final Widget? center;

  final Widget? right;

  const PageTitleBar({Key? key, this.center, this.right}) : super(key: key);

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
                  width: width * 0.33,
                  child: const RoundedBackButton()),
              Container(
                width: width * 0.33,
                alignment: Alignment.center,
                child: center ?? Container(),
              ),
              Container(
                  width: width * 0.33,
                  alignment: Alignment.centerRight,
                  child: right ?? Container())
            ]);
      })),
    );
  }
}
