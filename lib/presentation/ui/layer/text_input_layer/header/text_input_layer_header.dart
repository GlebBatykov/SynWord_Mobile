import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:poseidon/poseidon.dart';
import 'package:synword/presentation/cubit/button/language_select/language_select_button_cubit.dart';

import '../../../../asset/icon_asset.dart';
import '../../../../cubit/layer/text_input_layer/body/text_input_layer_body_cubit.dart';
import '../../../../cubit/layer/text_input_layer/header/text_input_layer_header_cubit.dart';
import '../../../../cubit/layer/text_input_layer/text_input_layer_cubit.dart';
import '../../../button/language_select_button.dart';
import '../../../dialog/language_selection/language_selection_dialog.dart';
import '../../layer_close_button.dart';
import '../../layer_properties.dart';
import 'text_input_layer_header_copy_button.dart';

class TextInputLayerHeader extends StatelessWidget {
  const TextInputLayerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textInputLayerCubit = context.watch<TextInputLayerCubit>();

    var textInputLayerBodyCubit = context.watch<TextInputLayerBodyCubit>();

    return BlocBuilder<TextInputLayerHeaderCubit, TextInputLayerHeaderState>(
        builder: (context, state) {
      if (state is TextInputLayerHeaderShow) {
        if (state is TextInputLayerHeaderForeground) {
          if (state is TextInputLayerHeaderNotEmpty) {
            return Container(
              margin: const EdgeInsets.only(
                  top: 12, left: 13, right: 13, bottom: 3),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: state.textLength.toString(),
                                style: TextStyle(
                                    color: state.textLength <=
                                            state.lengthBorders.min
                                        ? HexColor('#D6401F')
                                        : Colors.black)),
                            const TextSpan(text: '/20000')
                          ])),
                      const SizedBox(width: 8),
                      Image.asset(
                        IconAsset.info,
                        width: 20,
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: BlocProvider(
                              create: (context) => LanguageSelectButtonCubit(),
                              child: const LanguageSelectButton()))
                    ]),
                    Row(
                      children: [
                        if (state.textLength > 0)
                          TextInputLayerHeaderCopyButton(
                            onTap: () async {
                              await textInputLayerBodyCubit.copy();
                            },
                          ),
                        LayerCloseButton(onTap: () {
                          textInputLayerCubit.toEmpty();
                        })
                      ],
                    )
                  ]),
            );
          } else {
            return Container();
          }
        } else {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: Container(
              height: LayerProperties.headerHeight,
              color: HexColor('B6452C'),
              child: const Center(
                child: Text('Source text',
                    style: TextStyle(
                        fontFamily: 'Audrey',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
            ),
          );
        }
      } else {
        return Container();
      }
    });
  }
}
