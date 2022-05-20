import 'package:flutter/material.dart';

import '../layer_properties.dart';
import '../../load_screen.dart';
import '../layer_header.dart';
import '../operation_layer/rephrase/rephrase_layer_cubit_copy_button.dart';

class RephraseAnimatedLayer extends StatelessWidget {
  final Size size;

  const RephraseAnimatedLayer({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          size.width - LayerProperties.marginLeft - LayerProperties.marginRight,
      height: size.height -
          LayerProperties.marginLeft -
          LayerProperties.marginRight,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0, -10),
                blurRadius: 15)
          ]),
      child: Column(
        children: const [
          SizedBox(
              height: LayerProperties.headerHeight,
              child: LayerHeader(
                  isActionsVisible: true,
                  actions: [RephraseLayerCubitCopyButton()],
                  title: 'Rephrase')),
          Expanded(
              child: LoadScreen(
            subtitle: 'The average waiting time is 15 seconds',
          ))
        ],
      ),
    );
  }
}
