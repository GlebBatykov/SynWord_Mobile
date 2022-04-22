import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../cubit/page/history/history_page_cubit.dart';
import '../../page_body.dart';

class HistoryPageBody extends StatelessWidget {
  const HistoryPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryPageCubit, HistoryPageState>(
        builder: (context, state) {
      if (state is HistoryPageSignIn) {
        return PageBody(
          padding: const EdgeInsets.only(top: 124),
          child: LayoutBuilder(builder: ((context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 29),
                      child: Text('Please sign in to continue',
                          style: TextStyle(fontSize: 16))),
                  Container(
                      width: 158,
                      height: 30,
                      decoration:
                          BoxDecoration(color: HexColor('#C4C4C4'), boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 5),
                      ]))
                ],
              ),
            );
          })),
        );
      } else {
        return Container();
      }
    });
  }
}
