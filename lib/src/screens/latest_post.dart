import 'package:blogapi/src/constant.dart';
import 'package:blogapi/src/data/postdata.dart';
import 'package:blogapi/src/screens/post_details.dart';
import 'package:flutter/material.dart';

class LatestPost extends StatefulWidget {
  const LatestPost({Key? key}) : super(key: key);

  @override
  _LatestPostState createState() => _LatestPostState();
}

class _LatestPostState extends State<LatestPost> {
  PostData postData = PostData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: postData.getAllPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("0 Post "),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];

              return Card(
                elevation: 0.5,
                child: ListTile(
                  title: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            data['_embedded']['wp:featuredmedia'][0]
                                ['source_url'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Text(
                          data['title']['rendered'],
                          style: titleTextStyle,
                        )),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    data['content']['rendered']
                        .toString()
                        .replaceAll("<p>", "")
                        .replaceAll('</p>', ''),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: subTitleTextStyle,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostDetails(),
                      settings: RouteSettings(
                        arguments: data,
                      ),
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
