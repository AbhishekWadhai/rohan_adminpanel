import 'package:flutter/material.dart';
import 'package:responsivedashboard/helper/helpers.dart';

class MyTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback boxAction;
  const MyTile(
      {required this.title, required this.icon, required this.boxAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: boxAction,
        child: Container(
          height: 78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Colors.blue[100]!,
                Colors.blueGrey.shade50,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(
                  width: flexWidth(context, 1),
                ),
                Text(title),
                const Spacer(),
                const Text("2")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
