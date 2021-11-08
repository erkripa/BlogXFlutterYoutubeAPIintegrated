import 'package:flutter/material.dart';

class ImageDetails extends StatefulWidget {
  const ImageDetails({Key? key}) : super(key: key);

  @override
  _ImageDetailsState createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as dynamic;
    final image = data['_embedded']['wp:featuredmedia'][0]['source_url'];
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
