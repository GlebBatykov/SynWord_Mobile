import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../cubit/page/history/result/check/check_result_page_cubit.dart';
import '../../../pages_properties.dart';
import 'body/check_result_page_body.dart';
import 'title_bar/check_result_page_title_bar.dart';

class CheckResultPage extends StatelessWidget {
  const CheckResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckResultPageCubit, CheckResultPageState>(
        builder: (context, state) {
      if (state is CheckResultPageShow) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: HexColor('#301B28'),
          body: Container(
            margin: PagesProperties.margin,
            child: Column(
              children: [
                CheckResultPageTitleBar(percentages: state.percentages),
                const Expanded(child: CheckResultPageBody())
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: HexColor('#301B28'),
        );
      }
    });
  }
}
