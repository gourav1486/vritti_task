import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vritti_task/business_logic/data/model/employee_model.dart';
import 'package:vritti_task/database_helper.dart';

class GetEmployeeDetailsRepository {
  Future<void> getEmployeeDetails() async {
    EmployeeModel empDetails;
    final url = Uri.parse('https://reqres.in/api/users?page=1');
    http.Response responce = await http.get(url);

    if (responce.statusCode == 200) {
      empDetails = employeeModelFromJson(responce.body);
      await DatabaseHelper.initializeDatabase().then((db) {
        db.delete('employees');
      });
      for (var element in empDetails.data) {
        await DatabaseHelper.insertEmployee(element);
      }
    } else {}
  }
}
