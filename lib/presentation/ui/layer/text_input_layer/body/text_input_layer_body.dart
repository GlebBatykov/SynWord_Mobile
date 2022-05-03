import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/layer/text_input_layer/body/text_input_layer_body_cubit.dart';
import '../../../../cubit/layer/text_input_layer/header/text_input_layer_header_cubit.dart';
import '../../../../cubit/layer/text_input_layer/text_input_layer_cubit.dart';

class TextInputLayerBody extends StatelessWidget {
  const TextInputLayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textInputLayerCubit = context.watch<TextInputLayerCubit>();
    var textInputLayerHeaderCubit = context.watch<TextInputLayerHeaderCubit>();

    return BlocBuilder<TextInputLayerBodyCubit, TextInputLayerBodyState>(
        builder: (context, state) {
      if (state is TextInputLayerBodyShow) {
        if (state is TextInputLayerBodyForeground) {
          EdgeInsets margin;

          if (state is TextInputLayerBodyEmpty) {
            margin = const EdgeInsets.all(16);
          } else {
            margin = const EdgeInsets.only(left: 16, right: 16, bottom: 16);
          }

          return Container(
            margin: margin,
            child: TextFormField(
              controller: state.editingController,
              focusNode: state.focusNode,
              expands: true,
              maxLines: null,
              minLines: null,
              onTap: () {
                textInputLayerCubit.toEditing();
              },
              onChanged: (value) {
                textInputLayerHeaderCubit.changeTextLegnth(value.length);

                if (value.isNotEmpty) {
                  textInputLayerCubit.toEditing();
                }
              },
              onEditingComplete: () {
                if (state.editingController.text.isEmpty) {
                  textInputLayerCubit.toEmpty();
                } else {
                  textInputLayerCubit.toNotEmptyShow();
                }
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: state is TextInputLayerBodyEmpty
                      ? 'Text or website address'
                      : '',
                  hintStyle:
                      const TextStyle(fontFamily: 'Audrey', fontSize: 18)),
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: TextFormField(
              controller: state.editingController,
              expands: true,
              maxLines: null,
              minLines: null,
              readOnly: true,
            ),
          );
        }
      } else {
        return Container();
      }
    });
  }
}
