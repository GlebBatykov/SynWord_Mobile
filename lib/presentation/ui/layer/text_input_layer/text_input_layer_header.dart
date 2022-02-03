import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer/header/text_input_layer_header_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer/text_input_layer_cubit.dart';
import 'package:synword_flutter_cubit_application/presentation/ui/layer/layer_close_button.dart';

class TextInputLayerHeader extends StatelessWidget {
  const TextInputLayerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textInputLayerCubit = context.watch<TextInputLayerCubit>();

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
                      Text(state.textLength.toString() + '/20000',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/images/icons/info.png',
                        width: 20,
                        height: 20,
                      )
                    ]),
                    InkWell(
                      onTap: () {
                        textInputLayerCubit.toBackground();
                      },
                      child: const LayerCloseButton(),
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
              height: 55,
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
