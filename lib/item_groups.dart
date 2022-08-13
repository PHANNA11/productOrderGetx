import 'package:flutter/material.dart';

class IconsGroup extends StatelessWidget {
  IconsGroup({required this.icons, required this.icons_name, Key? key})
      : super(key: key);
  IconData icons;
  String icons_name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      // color: Colors.blue,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 230, 230),
                shape: BoxShape.circle),
            child: Center(
              child: Icon(icons),
            ),
          ),
          Text(icons_name)
        ],
      ),
    );
  }
}
