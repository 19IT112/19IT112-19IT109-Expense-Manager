import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final ValueChanged<Image> selecticon;

  Category({required this.selecticon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fonts"),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(225, (index) {
          Image selectIcon = Image.asset(
            "assets/action/1x_web/image (${index + 1}).png",
            color: Colors.black,
          );
          return Container(
            child: TextButton(
              child: selectIcon,
              onPressed: () {
                selecticon(selectIcon);
                Navigator.of(context).pop();
              },
            ),
          );
        }),
      ),
    );
  }
}
