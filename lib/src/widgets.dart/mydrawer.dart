import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, })
      : super(key: key);
// required this.context, required this.stateBool
  // final BuildContext context;
  // final bool stateBool;
//  stateBool ? Colors.grey[800] : 
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:Colors.pinkAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 55,
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Ayush Kumar",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("ayush@gmail.com",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            )),
            const Divider(
              thickness: 1.5,
              color: Colors.white,
              indent: 15,
              endIndent: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, i) {
                  return const ListTile(
                    title: Center(
                        child: Text(
                      "Services",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
