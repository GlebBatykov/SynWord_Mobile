import 'package:flutter/material.dart';

class ResultPageInitialText extends StatelessWidget {
  final String text;

  const ResultPageInitialText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 17, bottom: 17),
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: RawScrollbar(
              thickness: 1,
              isAlwaysShown: true,
              thumbColor: Colors.black.withOpacity(0.7),
              crossAxisMargin: 5,
              child: Container(
                margin: const EdgeInsets.only(left: 13, right: 13),
                child: SingleChildScrollView(
                    child: SelectableText(text,
                        style: const TextStyle(fontSize: 16))),
              ))),
    );
  }
}
