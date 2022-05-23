import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/presentation/ui/custom_scrollbar.dart';

import '../../cubit/dialog/rephrased_text/word_replacement/word_replacement_dialog_cubit.dart';

class WordReplacementDialog extends StatelessWidget {
  const WordReplacementDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();

    var dialogCubit = context.watch<WordReplacementDialogCubit>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 235,
        height: 320,
        padding:
            const EdgeInsets.only(top: 26, left: 27, right: 27, bottom: 26),
        child:
            BlocBuilder<WordReplacementDialogCubit, WordReplacementDialogState>(
                bloc: dialogCubit,
                builder: (context, state) {
                  if (state is WordReplacementDialogShow) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('WORD REPLACEMENT',
                            style: TextStyle(
                                fontFamily: 'Audrey',
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                        Container(
                          margin: const EdgeInsets.only(top: 17, bottom: 10),
                          child: const Text('Source',
                              style: TextStyle(
                                  fontFamily: 'Audrey',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 2, right: 2, top: 1, bottom: 1),
                          decoration: BoxDecoration(
                              color: HexColor('#DDC5A2'),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(state.word,
                              style: const TextStyle(fontSize: 16)),
                        ),
                        Container(
                          width: 146,
                          height: 1,
                          margin: const EdgeInsets.only(top: 18),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: const Text('Synonyms',
                              style: TextStyle(
                                  fontFamily: 'Audrey',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Expanded(
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                          onNotification: (notification) {
                            notification.disallowIndicator();

                            return true;
                          },
                          child: CustomScrollbar(
                            controller: scrollController,
                            child: ListView.builder(
                                controller: scrollController,
                                padding: EdgeInsets.zero,
                                itemCount: state.synonyms.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      dialogCubit.selectSynonym(index);
                                    },
                                    child: Align(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        padding: const EdgeInsets.only(
                                            left: 2,
                                            right: 2,
                                            top: 1,
                                            bottom: 1),
                                        decoration: BoxDecoration(
                                            color: HexColor('#DDC5A2'),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          state.synonyms[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ))
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
      ),
    );
  }
}
