import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer/body/paste_button/text_input_layer_body_paste_button_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer/body/text_input_layer_body_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer/text_input_layer_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/text_input_layer/body/text_input_layer_body_paste_button.dart';

class TextInputLayerBody extends StatelessWidget {
  const TextInputLayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textInputLayerCubit = context.watch<TextInputLayerCubit>();

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

          return LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  margin: margin,
                  child: TextFormField(
                    controller: state.editingController,
                    focusNode: state.focusNode,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        textInputLayerCubit.toEmpty();
                      } else {
                        textInputLayerCubit.toNotEmpty();
                        textInputLayerCubit.changeTextLegnth(value.length);
                      }
                    },
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Text or website address',
                        hintStyle:
                            TextStyle(fontFamily: 'Audrey', fontSize: 18)),
                  ),
                ),
                Positioned(
                  top: 17,
                  right: 12,
                  child: BlocProvider<TextInputLayerBodyPasteButtonCubit>.value(
                      value: state.pasteButtonCubit,
                      child: const TextInputLayerBodyPasteButton()),
                )
              ],
            );
          });
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
