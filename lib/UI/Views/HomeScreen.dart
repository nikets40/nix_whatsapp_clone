import 'package:flutter/material.dart';
import 'package:nixwhatsappclone/UI/Shared/Styles.dart';
import 'package:nixwhatsappclone/UI/Views/CallsScreenView.dart';
import 'package:nixwhatsappclone/UI/Views/ChatsScreenView.dart';
import 'package:nixwhatsappclone/UI/Views/StatusScreenView.dart';
import 'package:nixwhatsappclone/UI/Widgets/popupMenu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  IconData fabIcon;

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    List<Widget> myTabs = new List<Widget>();
    myTabs.add(ChatsScreen());
    myTabs.add(StatusScreen());
    myTabs.add(CallsScreen());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: primaryColorDark,
        title: Text('WhatsApp'),
        centerTitle: false,
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
      body: TabBarView(
        controller: _tabController,
        children: [ChatsScreen(), StatusScreen(), CallsScreen()],
      ),
    );
  }
}
