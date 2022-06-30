import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/presentation/ui/load_screen.dart';

import '../../../../cubit/page/history/body/history_page_cubit.dart';
import '../../../custom_scrollbar.dart';
import '../../page_body.dart';
import 'history_page_body_result_item.dart';

class HistoryPageBody extends StatelessWidget {
  const HistoryPageBody({Key? key}) : super(key: key);

  Widget _buildSignInState() {
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
  }

  Widget _buildShowState(BuildContext context, HistoryPageShow state) {
    return PageBody(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();

            return true;
          },
          child: MediaQuery.removePadding(
              removeBottom: true,
              removeTop: true,
              context: context,
              child: CustomScrollbar(
                  child: Container(
                padding: const EdgeInsets.only(left: 26, right: 26),
                child: state.itemsCubits.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.itemsCubits.length,
                        itemBuilder: (context, index) {
                          var margin = index < state.itemsCubits.length - 1
                              ? const EdgeInsets.only(bottom: 20)
                              : const EdgeInsets.only(bottom: 10);

                          return Align(
                            alignment: Alignment.center,
                            child: BlocProvider.value(
                                value: state.itemsCubits[index],
                                child:
                                    HistoryPageBodyResultItem(margin: margin)),
                          );
                        })
                    : const Center(
                        child: Text('History is empty',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Araboto-Medium')),
                      ),
              )))),
    );
  }

  Widget _buildLoadState() {
    return const PageBody(
      child: Center(child: LoadScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryPageBodyCubit, HistoryPageBodyState>(
        builder: (context, state) {
      if (state is HistoryPageSignIn) {
        return _buildSignInState();
      } else if (state is HistoryPageShow) {
        return _buildShowState(context, state);
      } else if (state is HistoryPageLoad) {
        return _buildLoadState();
      } else {
        return Container();
      }
    });
  }
}
