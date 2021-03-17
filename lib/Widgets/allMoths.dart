import 'package:flutter/material.dart';

class AllMonths extends StatelessWidget {
  const AllMonths({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12, bottom: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Feb 2021",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            child: Text(
              "All Months",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
