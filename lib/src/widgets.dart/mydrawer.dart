import 'package:blogapi/src/constant.dart';
import 'package:blogapi/src/data/page_data.dart';
import 'package:blogapi/src/screens/pages/page_details.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final PageData _pageData = PageData();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DrawerHeader(
                    child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        'https://bootdey.com/img/Content/avatar/avatar7.png',
                        scale: 1.0,
                      ),
                    ),
                    Text(
                      "Ayush Kumar\nayush@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )),
          Expanded(
            child: FutureBuilder<List>(
              future: _pageData.getAllPage,
              builder: (context, snapshots) {
                if (snapshots.hasData) {
                  if (snapshots.data!.isEmpty) {
                    return const Center(
                      child: Text("No Page Created yet!"),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshots.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.forward,
                          color: Colors.yellow,
                          size: 35,
                        ),
                        title: Text(
                          snapshots.data![index]['title']['rendered'],
                          style: kPageTitleTextStyle,
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PageDetails(),
                            settings: RouteSettings(
                              arguments: snapshots.data![index],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshots.hasError) {
                  return const Center(
                    child: Text("Server Error"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
