import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/layer/operation_layer/operation_layer.dart';
import '../../layer_close_button.dart';

class OperationLayerHeader extends StatelessWidget {
  const OperationLayerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationLayerHeaderCubit, OperationLayerHeaderState>(
        builder: (context, state) {
      if (state is OperationLayerHeaderForeground) {
        return LayoutBuilder(builder: (context, constraints) {
          return Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: constraints.maxWidth * 0.2,
                child: state.isActionsVisible
                    ? Row(
                        children: state.actions,
                      )
                    : Container(),
              ),
              Expanded(
                  child: Center(
                child: Text(state.title,
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
                  child: LayerCloseButton(onTap: () {}))
            ],
          );
        });
      } else if (state is OperationLayerHeaderBackground) {
        return Container();
      } else {
        return Container();
      }
    });
  }
}
