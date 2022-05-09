import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/layer/text_input_layer/body/text_input_layer_body_cubit.dart';
import '../../../../cubit/layer/text_input_layer/header/text_input_layer_header_cubit.dart';
import '../../../../cubit/layer/text_input_layer/text_input_layer_cubit.dart';
import '../../../custom_scrollbar.dart';
import 'text_input_layer_body_paste_button.dart';

class TextInputLayerBody extends StatelessWidget {
  const TextInputLayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputLayerCubit = context.watch<TextInputLayerCubit>();

    var headerCubit = context.watch<TextInputLayerHeaderCubit>();

    var bodyCubit = context.watch<TextInputLayerBodyCubit>();

    return BlocBuilder<TextInputLayerBodyCubit, TextInputLayerBodyState>(
        bloc: bodyCubit,
        builder: (context, state) {
          if (state is TextInputLayerBodyShow) {
            if (state is TextInputLayerBodyForeground) {
              EdgeInsets margin;

              if (state is TextInputLayerBodyEmpty) {
                margin = const EdgeInsets.all(16);
              } else {
                margin = const EdgeInsets.only(left: 16, right: 16, bottom: 16);
              }

              var scrollController = ScrollController();

              return Stack(children: [
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: CustomScrollbar(
                    controller: scrollController,
                    child: Container(
                      margin: margin,
                      child: TextFormField(
                        scrollController: scrollController,
                        controller: state.editingController,
                        focusNode: state.focusNode,
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        onTap: () {
                          inputLayerCubit.toEditing();
                        },
                        onChanged: (value) {
                          headerCubit.changeTextLegnth(value.length);

                          if (value.isNotEmpty) {
                            inputLayerCubit.toEditing();
                          }
                        },
                        onEditingComplete: () {
                          if (state.editingController.text.isEmpty) {
                            inputLayerCubit.toEmpty();
                          } else {
                            inputLayerCubit.toNotEmptyShow();
                          }
                        },
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: state is TextInputLayerBodyEmpty
                                ? 'Text or website address'
                                : '',
                            hintStyle: const TextStyle(
                                fontFamily: 'Audrey', fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                if (state is TextInputLayerBodyEmpty)
                  Positioned(
                    top: 17,
                    right: 12,
                    child: TextInputLayerBodyPasteButton(
                      onTap: () async {
                        await bodyCubit.paste();
                      },
                    ),
                  )
              ]);
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
