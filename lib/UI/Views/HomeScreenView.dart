import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';
import 'package:nixwhatsappclone/UI/Tabs/CallsTabView.dart';
import 'package:nixwhatsappclone/UI/Tabs/ChatsTabView.dart';
import 'package:nixwhatsappclone/UI/Tabs/StatusTabView.dart';
import 'package:nixwhatsappclone/UI/Widgets/popupMenu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  IconData fabIcon;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    fabIcon = Icons.message;
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
//    _tabController.addListener(() {
//      if (_tabController.index == 0) {
//        setState(() {
//          fabIcon = Icons.message;
//        });
//      } else if (_tabController.index == 1) {
//        setState(() {
//          fabIcon = Icons.camera_alt;
//        });
//      } else if (_tabController.index == 2) {
//        setState(() {
//          fabIcon = Icons.add_call;
//        });
//      }
//      setState(() {});
//    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          //<-- headerSliverBuilder
          return <Widget>[
            new SliverAppBar(
              backgroundColor: primaryColorDark,
              title: new Text("WhatsApp"),
              pinned: true,
              centerTitle: false,

              floating: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                PopUpMenu(),
              ],
              //<-- forceElevated to innerBoxIsScrolled
              bottom: TabBar(
                indicatorColor: Colors.white,
                controller: _tabController,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'CHATS',
                      style: TabBarTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'STATUS',
                      style: TabBarTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'CALLS',
                      style: TabBarTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: new TabBarView(
          children: <Widget>[ChatsTab(), StatusTab(), CallsTab()],
          controller: _tabController,
        ),
      ),
    );
  }
}
