import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Models/transaction.dart' as td;
import 'package:expense_manager/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<td.Transaction> transaction;

  TransactionList(this.transaction);

  static final valueController = TextEditingController();

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    // var icon;
    // transaction.forEach((element) {
    //   icon = element.icons;
    // });

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                // InkWell(
                //   onTap: () {
                //     showDialog(
                //       context: context,
                //       builder: (context) {
                //         return Dialog(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10)),
                //           child: Container(
                //             height: 200,
                //             child: Column(
                //               children: [
                //                 Text(
                //                   "Set Limit",
                //                   style: TextStyle(
                //                       fontSize: 22,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.all(10.0),
                //                   child: TextField(
                //                     controller: valueController,
                //                   ),
                //                 ),
                //                 TextButton(
                //                   onPressed: () {
                //                     Navigator.of(context).pop();
                //                     setState(() {});
                //                     print(valueController.text);
                //                   },
                //                   child: Text("ok"),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //     );
                //   },
                //   child: Text(
                //     "Set Limit " + (valueController.text),
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),
            Column(
              children: widget.transaction.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: e.icons,
                    title: Text(
                      e.label,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle:
                        Text(DateFormat().add_MMMMEEEEd().format(e.dateTime)),
                    trailing: Text(
                      "\u{20B9}${e.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
    // final uid = Authentication.getCurrentUID();
    // final collection = FirebaseFirestore.instance
    //     .collection("userData")
    //     .doc(uid)
    //     .collection("Transaction")
    //     .snapshots();
    // return Flexible(
    //   child: StreamBuilder(
    //       stream: collection,
    //       builder: (context, AsyncSnapshot snapshot) {
    //         final item = snapshot.data?.docs.length;
    //         return Card(
    //           margin: EdgeInsets.all(10),
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10)),
    //           child: ListView.builder(
    //               itemCount: item,
    //               itemBuilder: (context, index) {
    //                 final data = snapshot.data?.docs[index];
    //                 return ListTile(
    //                   //leading: icon,
    //                   title: Text(data?['title']),
    //                   subtitle: Text(DateFormat('dd/mm/yyyy')
    //                       .format(data['Date'].toDate())),
    //                   trailing: Text(data['amount'].toString()),
    //                 );
    //               }),
    //         );
    //       }),
    // );
  }
}
