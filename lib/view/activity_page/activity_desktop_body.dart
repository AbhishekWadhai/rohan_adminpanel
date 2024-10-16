import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsivedashboard/controller/activity_page_controller.dart';
import 'package:responsivedashboard/helper/helpers.dart';
import 'package:responsivedashboard/routes/routes_string.dart';

class ActivityPage extends StatelessWidget {
  final dynamic activityName = Get.arguments[0];
  final dynamic endpoint = Get.arguments[1];

  final controller = Get.put(ActivityPageController());
  ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getPermitData(endpoint);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(activityName),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_filled),
            onPressed: () {
              Get.offAllNamed(Routes.homePage);
            },
          ),
        ],
        elevation: 2,
      ),
      body: Stack(
        children: [
          Obx(
            () => controller.activitytList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.activitytList.length,
                          itemBuilder: (context, index) {
                            final activity = controller.activitytList[index];
                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ListTile(
                                // tileColor: permit.verifiedDone
                                //     ? Colors.green[100]
                                //     : Colors.red[100],

                                title: getTitle(endpoint, activity),
                                subtitle: Text(
                                  'Date: ${DateFormat('dd MM yyyy').format(DateTime.parse(activity.date ?? ""))}',
                                ),
                                trailing: SizedBox(
                                  width: flexWidth(context, 5),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirm Delete'),
                                                    content: const Text(
                                                        'Are you sure you want to delete this item?'),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                            'Cancel'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(); // Close the dialog
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Text(
                                                            'Delete'),
                                                        onPressed: () async {
                                                          controller
                                                              .deleteActivity(
                                                                  endpoint,
                                                                  activity.id);
                                                          Navigator.of(context)
                                                              .pop(); // Delete the item
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: const Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () async {
                                            print(jsonEncode(activity));
                                            var result = await Get.toNamed(
                                                Routes.actionPage,
                                                arguments: [
                                                  endpoint,
                                                  activity.toJson(),
                                                  true
                                                ]);
                                            if (result == true) {
                                              controller
                                                  .getPermitData(endpoint);
                                            }
                                          },
                                          icon: const Icon(Icons.edit)),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  // Handle on tap if needed
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      var result = await Get.toNamed(
                        Routes.formPage,
                        arguments: [endpoint, <String, dynamic>{}, false],
                      );
                      if (result == true) {
                        controller.getPermitData(endpoint);
                      }
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTitle(String endpoint, dynamic activity) {
    switch (endpoint) {
      case 'permit':
        return Text("Description : ${activity.workDescription}");
      case 'uauc':
        return Text("'Project Name: ${activity.projectName.projectName}'");
      case 'meeting':
        return Text(' Topic: ${activity.topicName}');
      case 'induction':
        return Text(' Topic: ${activity.projectName.projectName}');
      case 'specific':
        return Text(' Topic: ${activity.projectName.projectName}');
      default:
        return Text("data");
    }
  }
}
