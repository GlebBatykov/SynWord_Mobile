import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/layer/operation_layer/rephrase/rephrase_layer_body_content_data.dart';
import '../../../rephrased_text/rephrased_text.dart';

class RephraseLayerBody extends StatelessWidget {
  final RephraseLayerBodyContentData data;

  const RephraseLayerBody({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 17),
        child: BlocProvider.value(
            value: data.rephrasedTextCubit, child: const RephrasedText()));
  }
}
