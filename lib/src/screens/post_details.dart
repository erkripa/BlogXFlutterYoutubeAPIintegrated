import 'package:blogapi/src/constant.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    Key? key,
  }) : super(key: key);

  static const routName = '/postdetails';
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details "),
      ),
      body: ListView(
        children: [
          Image.network(data['_embedded']['wp:featuredmedia'][0]['source_url']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data['title']['rendered'],
              style: titleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data['content']['rendered']
                  .toString()
                  .replaceAll("<p>", "")
                  .replaceAll('</p>', ''),
              style: subTitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
