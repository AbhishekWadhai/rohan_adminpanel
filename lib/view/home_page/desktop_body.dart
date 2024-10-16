import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsivedashboard/utils/utilities.dart';

import '../../constants.dart';



class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            myDrawer,

            // first half of page
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // first 4 boxes in grid
                  AspectRatio(
                    aspectRatio: 3,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        // scrollDirection: ,
                        itemCount: Utilities.boxes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6),
                        itemBuilder: (context, index) {
                          return Utilities.boxes[index];
                        },
                      ),
                    ),
                  ),

                  // list of previous days
                  Expanded(
                    child: ListView.builder(
                      itemCount: Utilities.myTiles.length,
                      itemBuilder: (context, index) {
                        return Utilities.myTiles[index];
                      },
                    ),
                  ),
                ],
              ),
            ),
            // second half of page
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: PieChart(
                            PieChartData(centerSpaceRadius: 0, sections: [
                          PieChartSectionData(
                              radius: 150, value: 20, color: Colors.blue),
                          PieChartSectionData(
                              radius: 150, value: 40, color: Colors.red),
                          PieChartSectionData(
                              radius: 150, value: 60, color: Colors.yellow),
                          PieChartSectionData(
                              radius: 150, value: 80, color: Colors.green)
                        ])),
                      ),
                    ),
                  ),
                  // list of stuff
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue[200],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
