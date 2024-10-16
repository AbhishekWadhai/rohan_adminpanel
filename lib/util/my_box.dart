import 'package:flutter/material.dart';
import 'package:responsivedashboard/helper/helpers.dart';

class MyBox extends StatelessWidget {
  final String boxTitle;
  final IconData icon;
  final VoidCallback boxAction;
  MyBox({required this.boxTitle, required this.icon, required this.boxAction});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: boxAction,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: flexWidth(context, 2),
                  backgroundColor: Colors.white,
                  child: Icon(
                    icon,
                    size: MediaQuery.of(context).size.width * 0.02,
                  )),
                  SizedBox(height: flexHeight(context, 1.5),),
              Text(boxTitle, style:TextStyle(fontWeight: FontWeight.bold, fontSize: flexHeight(context, 2)),)
            ],
          ),
        ),
      ),
    );
  }
}
