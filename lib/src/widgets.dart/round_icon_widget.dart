import 'package:blogapi/src/constant.dart';
import 'package:flutter/material.dart';

class RoundIconWidget extends StatelessWidget {
  const RoundIconWidget({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10, right: 5),
      decoration: kIconboxDecoration,
      child: IconButton(
        icon: Icon(icon),
        splashColor: Colors.pink,
        highlightColor: Colors.white38,
        onPressed: onPress,
      ),
    );
  }
}
