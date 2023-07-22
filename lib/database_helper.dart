import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:vritti_task/business_logic/data/model/employee_model.dart';

class DatabaseHelper {
  static Future<Database> initializeDatabase() async {
    final String databaseName = "employee_database.db";
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE employees(id INTEGER PRIMARY KEY, email TEXT, first_name TEXT, last_name TEXT, avatar TEXT)",
        );
      },
    );
  }

  static Future<void> insertEmployee(EmployeeDetails employee) async {
    final Database db = await initializeDatabase();
    await db.insert(
      'employees',
      employee.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<EmployeeDetails>> getAllEmployees() async {
    final Database db = await initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query('employees');
    return List.generate(
      maps.length,
          (index) {
        return EmployeeDetails.fromJson(maps[index]);
      },
    );
  }

static Future<void> deleteEmployee(int employeeId) async {
    final Database db = await initializeDatabase();
    await db.delete(
      'employees',
      where: 'id = ?',
      whereArgs: [employeeId],
    );
  }
   static Future<void> updateEmployee(EmployeeDetails updatedEmployee) async {
    final Database db = await initializeDatabase();
    await db.update(
      'employees',
      updatedEmployee.toJson(),
      where: 'id = ?',
      whereArgs: [updatedEmployee.id],
    );
  }
}
