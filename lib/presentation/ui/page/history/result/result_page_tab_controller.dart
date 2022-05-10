import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../asset/history_page_asset.dart';
import '../../page_body.dart';

class ResultPageTabController extends StatefulWidget {
  final Widget first;

  final Widget second;

  final void Function(int)? onChange;

  const ResultPageTabController(
      {Key? key, required this.first, required this.second, this.onChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResultPageTabControllerState();
}

class _ResultPageTabControllerState extends State<ResultPageTabController>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    if (widget.onChange != null) {
      _tabController.addListener(() {
        widget.onChange!.call(_tabController.index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 33, right: 33, bottom: 4),
              child: TabBar(
                  controller: _tabController,
                  indicatorColor: HexColor('B6452C'),
                  tabs: [
                    Tab(
                      child: Image.asset(HistoryPageAsset.note,
                          width: 30, height: 30),
                    ),
                    Tab(
                      child: Image.asset(HistoryPageAsset.website,
                          width: 30, height: 30),
                    )
                  ]),
            ),
            Expanded(
                child: PageBody(
                    child: TabBarView(
                        controller: _tabController,
                        children: [widget.first, widget.second])))
          ],
        ));
  }
}
