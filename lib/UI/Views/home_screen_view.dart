import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/styles.dart';
import 'package:nixwhatsappclone/UI/Tabs/calls_tab.dart';
import 'package:nixwhatsappclone/UI/Tabs/chats_tab.dart';
import 'package:nixwhatsappclone/UI/Tabs/status_tab.dart';
import 'package:nixwhatsappclone/UI/Widgets/popup_menu_widget.dart';
import 'package:nixwhatsappclone/services/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  IconData fabIcon;
  VoidCallback fabOnPressed = (){ NavigationService.instance.navigateTo("all_contacts");};

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    fabIcon = Icons.message;
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);

    _tabController.addListener(() {
      if (_tabController.index == 1) {
        setState(() {
          fabIcon = Icons.message;
          fabOnPressed = (){
            NavigationService.instance.navigateTo("all_contacts");
          };
        });
      } else if (_tabController.index == 2) {
        print("tab changed");
        setState(() {
          fabIcon = Icons.camera_alt;
        });
      } else if (_tabController.index == 3) {
        setState(() {
          fabIcon = Icons.add_call;
        });
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabWidth = (screenWidth(context)-40)/3;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        child: Icon(
          fabIcon,
          color: Colors.white,
        ),
        onPressed: fabOnPressed,
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
              primary: true,
              floating: true,
              automaticallyImplyLeading: false,
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
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                tabs: [
                  Container(width: 40,child: Center(child: Icon(Icons.camera_alt))),
                  Container(
                    width: tabWidth,
                    child: Center(
                      child: Text(
                        'CHATS',
                        style: TabBarTextStyle,
                      ),
                    ),
                  ),
                  Container(
                    width: tabWidth,
                    child: Center(
                      child: Text(
                        'STATUS',
                        style: TabBarTextStyle,
                      ),
                    ),
                  ),
                  Container(
                    width: tabWidth,
                    child: Center(
                      child: Text(
                        'CALLS',
                        style: TabBarTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: new TabBarView(
          children: <Widget>[Container(), ChatsTab(), StatusTab(), CallsTab()],
          controller: _tabController,
        ),
      ),
    );
  }
}
