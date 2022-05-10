import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/rephrased_text/rephrased_text_cubit.dart';
import '../custom_scrollbar.dart';

class RephrasedText extends StatelessWidget {
  const RephrasedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RephrasedTextCubit, RephrasedTextState>(
        builder: (context, state) {
      if (state is RephrasedTextShow) {
        var scrollController = ScrollController();

        return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: CustomScrollbar(
                controller: scrollController,
                child: Container(
                  margin: const EdgeInsets.only(left: 13, right: 13),
                  child: SingleChildScrollView(
                      controller: scrollController,
                      child: SelectableText.rich(TextSpan(
                          style: const TextStyle(fontSize: 16),
                          children: state.spans))),
                )));
      } else {
        return Container();
      }
    });
  }
}
