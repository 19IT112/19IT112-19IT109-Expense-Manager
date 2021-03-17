import 'package:flutter/material.dart';

import 'pages.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void changePage() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Pages()));
    }

    return InkWell(
      onTap: changePage,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OverView",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 25,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Total expense",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "\u{20B9}${15000}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
