import 'package:blogapi/src/constant.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(title: Text(data['title']['rendered'])),
      body: ListView(
        children: [
          Text(
            data['content']['rendered']
                .toString()
                .replaceAll("<p>", "")
                .replaceAll('</p>', ''),
            style: kDescStyle,
          ),
        ],
      ),
    );
  }
}
