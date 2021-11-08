import 'package:blogapi/src/constant.dart';
import 'package:blogapi/src/screens/latest_post.dart';
import 'package:blogapi/src/screens/photos.dart';
import 'package:blogapi/src/screens/popular_post.dart';
import 'package:blogapi/src/screens/video_page.dart';
import 'package:blogapi/src/settings/settings_view.dart';
import 'package:blogapi/src/widgets.dart/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTabs extends StatefulWidget {
  const MainTabs({Key? key}) : super(key: key);

  static const routName = '/maintabs';

  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final _scafoldKey = GlobalKey<ScaffoldState>();
  // var stateBool = false;
  final List<Tab> _tabs = <Tab>[
    const Tab(child: Text('Latest', style: kTabStyle)),
    const Tab(child: Text('Popular', style: kTabStyle)),
    const Tab(child: Text('Photos', style: kTabStyle)),
    const Tab(child: Text('Video', style: kTabStyle)),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: _tabs.length,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  Future<bool> _onWillPopScope() async {
    if (tabController!.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(const Duration(microseconds: 200), () {
      tabController!.index = 0;
    });
    return tabController!.index == 0;
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text("BlogX"),
      actions: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white24,
          ),
          child: IconButton(
            icon: const Icon(Icons.search),
            splashColor: Colors.pink,
            highlightColor: Colors.white38,
            onPressed: () => {},
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white24,
          ),
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white24,
          ),
          child: IconButton(
            icon: const Icon(Icons.menu),
            splashColor: Colors.pink,
            highlightColor: Colors.white38,
            onPressed: () {
              // stateBool = true;

              _scafoldKey.currentState!.openEndDrawer();
              // setState(() {});
            },
          ),
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        tabs: _tabs,
      ),
    );
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        key: _scafoldKey,
        appBar: appBar,
        endDrawer: const MyDrawer(),
        body: TabBarView(
          controller: tabController,
          children: [
            const LatestPost(),
            const PopularPost(),
            Myphotos(),
            MyVideoPlayePage(),
          ],
        ),
      ),
    );
  }
}
