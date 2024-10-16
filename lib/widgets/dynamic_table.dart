import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/controller/dynamictable_controller.dart';
import 'package:responsivedashboard/helper/helpers.dart';
import 'package:responsivedashboard/routes/routes_string.dart';

class DynamicTable extends StatelessWidget {
  final String pageName;
  DynamicTable({super.key, required this.pageName});

  final DynamicTableController controller = Get.put(DynamicTableController());

  @override
  Widget build(BuildContext context) {
    // Load data for the specified page
    controller.loadApiData(pageName);

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Table Name and Actions (always shown)
        Widget tableHeader = Row(
          children: [
            Text(pageName),
            Spacer(),
            IconButton(
              onPressed: () {
                controller.editTableRow(pageName);
              },
              icon: const Icon(Icons.edit),
            ),
            SizedBox(width: flexWidth(context, 1)),
            IconButton(
              onPressed: () {
                controller.deleteRow(pageName);
              },
              icon: const Icon(Icons.delete),
            ),
            SizedBox(width: flexWidth(context, 1)),
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.actionPage,
                    arguments: [pageName, <String, dynamic>{}, false]);
              },
              icon: const Icon(Icons.add_to_photos_rounded),
            ),
          ],
        );

        if (controller.tableData.isEmpty) {
          // Only show the table name and actions when no data is available
          return Column(
            children: [
              tableHeader,
              const Spacer(), // Add spacing for proper alignment
              const Center(child: Text('This Table is Empty')),
              const Spacer(),
            ],
          );
        }

        // Show the table when data is available
        return ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: Column(
            children: [
              tableHeader,
              SizedBox(height: flexHeight(context, 1)),
              Expanded(
                // Keep Expanded directly inside Column
                child: DataTable2(
                  minWidth: 600,
                  headingRowColor:
                      MaterialStateProperty.all(Colors.blue.shade100),
                  headingTextStyle: const TextStyle(fontSize: 18),
                  columns: controller.getTableColumns(),
                  rows: controller.getTableRows(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
