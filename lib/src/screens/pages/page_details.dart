import 'package:blogapi/src/constant.dart';
import 'package:flutter/material.dart';

class PageDetails extends StatelessWidget {
  const PageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(title: Text(data['title']['rendered'])),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data['content']['rendered']
                  .toString()
                  .replaceAll("<p>", "")
                  .replaceAll('</p>', ''),
              style: kDescStyle,
            ),
          ),
        ],
      ),
    );
  }
}
