import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/routes/routes_string.dart';
import 'package:responsivedashboard/services/api_services.dart';

class DynamicTableController extends GetxController {
  RxList<dynamic> tableData =
      <dynamic>[].obs; // Initialize as an observable list
  RxList<bool> selectedRows = <bool>[].obs;
  RxMap<String, dynamic> selectedRowsData =
      <String, dynamic>{}.obs; // Observable list to track selected rows
  var isLoading = true.obs;

  Future<void> loadApiData(String endpoint) async {
    if (endpoint == "user/register") {
      endpoint = "user";
    }
    try {
      isLoading.value = true;
      final response = await ApiService().getRequest(endpoint);

      if (response != null) {
        tableData.value = response; // Update the observable list
        selectedRows.value = List<bool>.filled(
            response.length, false); // Initialize selected rows with false
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  List<DataColumn> getTableColumns() {
    if (tableData.isEmpty) return [];

    // List of keys to exclude
    List<String> excludedKeys = ['_id', 'password', '__v'];

    // Get column keys after excluding unwanted fields
    List<String> columnKeys =
        tableData[0].keys.where((key) => !excludedKeys.contains(key)).toList();

    // Add a "Serial No" column as the first column
    return [
      const DataColumn(
        label: Text(
          'Serial No',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      ...columnKeys
          .map((key) => DataColumn(
                label: Text(
                  key,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
    ];
  }

  List<DataRow> getTableRows() {
    if (tableData.isEmpty) return [];

    // List of keys to exclude
    List<String> excludedKeys = ['_id', 'password', '__v'];

    // Get column keys after excluding the unwanted fields
    List<String> columnKeys =
        tableData[0].keys.where((key) => !excludedKeys.contains(key)).toList();

    return tableData.asMap().entries.map((entry) {
      int index = entry.key; // This gives the serial number (starting from 0)
      Map<String, dynamic> row = entry.value;

      return DataRow(
        selected: selectedRows[index], // Update selected state
        onSelectChanged: (bool? selected) {
          selectedRows[index] = selected ?? false;
          selectedRowsData.value = row; // Update selection state
        },
        cells: [
          // Add serial number as the second cell
          DataCell(Text(
            (index + 1).toString(),
            style: const TextStyle(color: Colors.grey),
          )),
          ...columnKeys.map<DataCell>((key) {
            return DataCell(
              showEditIcon: false,
              Text(row.containsKey(key) ? row[key].toString() : ''),
            );
          }).toList(),
        ],
      );
    }).toList();
  }

  editTableRow(String endpoint) async {
    var result = await Get.toNamed(
      Routes.actionPage,
      arguments: [endpoint, selectedRowsData, true],
    );
    if (result == true) {
      loadApiData(endpoint);
    }
  }

  deleteRow(String endpoint) async {
    print("Selected rows data ${jsonEncode(selectedRowsData)}");
    await ApiService().deleteRequest(endpoint, selectedRowsData["_id"]);
    loadApiData(endpoint);
  }
}
