import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/layer/text_input_layer/body/paste_button/text_input_layer_body_paste_button_cubit.dart';

class TextInputLayerBodyPasteButton extends StatelessWidget {
  const TextInputLayerBodyPasteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputLayerBodyPasteButtonCubit,
        TextInputLayerBodyPasteButtonState>(builder: (context, state) {
      return state is TextInputLayerBodyPasteButtonVisible
          ? ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Container(
                padding: EdgeInsets.zero,
                width: 40,
                height: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      splashRadius: 30,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/icons/paste.png',
                        width: 25,
                        height: 25,
                        color: Colors.black.withOpacity(0.6),
                      )),
                ),
              ),
            )
          : Container();
    });
  }
}
