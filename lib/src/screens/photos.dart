import 'package:blogapi/src/data/postdata.dart';
import 'package:blogapi/src/screens/image_details.dart';
import 'package:blogapi/src/widgets.dart/cprogress_idicator.dart';
import 'package:flutter/material.dart';

class Myphotos extends StatelessWidget {
  Myphotos({Key? key}) : super(key: key);

  final PostData postData = PostData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: postData.getAllPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Photso Uploded yet!"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              return GestureDetector(
                onDoubleTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImageDetails(),
                        settings: RouteSettings(
                          arguments: data,
                        ))),
                child: Container(
                  color: Colors.white.withOpacity(0.9),
                  child: Card(
                    child: Image.network(
                      data['_embedded']['wp:featuredmedia'][0]['source_url'],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Server Error"),
          );
        } else {
          return const CProgressIndicator();
        }
      },
    );
  }
}
