import 'package:blogapi/src/constant.dart';
import 'package:blogapi/src/screens/latest_post.dart';
import 'package:blogapi/src/screens/myvideos.dart';
import 'package:blogapi/src/screens/photos.dart';
import 'package:blogapi/src/screens/popular_post.dart';
import 'package:blogapi/src/settings/settings_view.dart';
import 'package:blogapi/src/widgets.dart/mydrawer.dart';
import 'package:blogapi/src/widgets.dart/round_icon_widget.dart';
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
        RoundIconWidget(icon: Icons.search, onPress: () => {}),
        RoundIconWidget(
            icon: Icons.settings,
            onPress: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            }),
        RoundIconWidget(
            icon: Icons.menu,
            onPress: () {
              _scafoldKey.currentState!.openEndDrawer();
            })
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
            const MyVideos(),
          ],
        ),
      ),
    );
  }
}
