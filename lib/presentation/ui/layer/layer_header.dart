import 'package:flutter/material.dart';

import 'layer_close_button.dart';

class LayerHeader extends StatelessWidget {
  final bool isActionsVisible;

  final List<Widget> actions;

  final String title;

  final void Function()? onClose;

  const LayerHeader(
      {super.key,
      required this.isActionsVisible,
      required this.actions,
      required this.title,
      this.onClose});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: constraints.maxWidth * 0.2,
              child: isActionsVisible
                  ? Row(
                      children: actions,
                    )
                  : Container(),
            ),
            Expanded(
                child: Center(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Audrey',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal)),
            )),
            Container(
                padding: const EdgeInsets.only(right: 25),
                alignment: Alignment.centerRight,
                width: constraints.maxWidth * 0.20,
                child: LayerCloseButton(onTap: () {
                  onClose?.call();
                }))
          ],
        );
      },
    );
  }
}