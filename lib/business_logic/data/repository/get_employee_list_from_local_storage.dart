import 'package:vritti_task/business_logic/data/model/employee_model.dart';
import 'package:vritti_task/database_helper.dart';

class GetEmployeeDetailsFromLocalStorage {
  Future<List<EmployeeDetails>> getEmployeeListFromLocalStorage() async {
    List<EmployeeDetails> employeeList = [];
    try {
      employeeList = await DatabaseHelper.getAllEmployees();
      return employeeList;
    } catch (e) {
      employeeList.clear();
      return employeeList;
    }
  }
}
