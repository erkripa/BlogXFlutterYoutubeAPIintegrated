import 'package:flutter/material.dart';

class CProgressIndicator extends StatelessWidget {
  const CProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor, // Red
        ),
      ),
    );
  }
}
