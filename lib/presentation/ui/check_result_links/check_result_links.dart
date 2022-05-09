import 'package:flutter/material.dart';

import '../../model/page/history/result/check/check_result_link.dart';
import '../custom_scrollbar.dart';
import 'checked_link.dart';

class CheckResultLinks extends StatelessWidget {
  final List<CheckResultLink> links;

  final double scrollbarCrossAxisMargin;

  const CheckResultLinks(
      {Key? key, required this.links, this.scrollbarCrossAxisMargin = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();

    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();

          return true;
        },
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: CustomScrollbar(
                controller: scrollController,
                crossAxisMargin: scrollbarCrossAxisMargin,
                child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.only(left: 22, right: 34),
                    itemCount: links.length,
                    itemBuilder: (context, index) {
                      return CheckedLink(
                          url: links[index].url,
                          percentages: links[index].percentages);
                    }))));
  }
}
