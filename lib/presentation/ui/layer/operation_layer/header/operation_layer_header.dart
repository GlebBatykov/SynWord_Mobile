import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/layer/operation_layer/operation_layer.dart';
import '../../layer_header.dart';

class OperationLayerHeader extends StatelessWidget {
  const OperationLayerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationLayerHeaderCubit, OperationLayerHeaderState>(
        builder: (context, state) {
      if (state is OperationLayerHeaderForeground) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (details) {
            state.onVerticalDragUpdate(details);
          },
          onVerticalDragEnd: (details) {
            state.onVerticalDragEnd(details);
          },
          child: LayerHeader(
              isActionsVisible: state.isActionsVisible,
              actions: state.actions,
              title: state.title,
              onClose: state.onClose),
        );
      } else if (state is OperationLayerHeaderBackground) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (details) {
            state.onVerticalDragUpdate(details);
          },
          onVerticalDragEnd: (details) {
            state.onVerticalDragEnd(details);
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: Container(
              color: state.color,
              child: Center(
                child: Text(state.title,
                    style: const TextStyle(
                        fontFamily: 'Audrey',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.black)),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
