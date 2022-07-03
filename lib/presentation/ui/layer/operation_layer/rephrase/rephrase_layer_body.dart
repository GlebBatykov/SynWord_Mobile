import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/layer/operation_layer/rephrase/content_data/rephrase_layer_body_content_data.dart';
import '../../../custom_scrollbar.dart';
import '../../../rephrased_text/rephrased_text.dart';

class RephraseLayerBody extends StatelessWidget {
  final RephraseLayerBodyContentData data;

  const RephraseLayerBody({Key? key, required this.data}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    if (data is RephraseLayerBodyRephraseData) {
      return BlocProvider.value(
          value: (data as RephraseLayerBodyRephraseData).rephrasedTextCubit,
          child: const RephrasedText());
    } else {
      var text = (data as RephraseLayerBodyEnhancedRephraseData).text;

      var scrollController = ScrollController();

      var editingController = TextEditingController(text: text);

      return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: CustomScrollbar(
              controller: scrollController,
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                    scrollController: scrollController,
                    controller: editingController,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    )),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 17),
        child: _buildBody(context));
  }
}
