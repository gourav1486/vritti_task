part of 'get_employee_list_from_local_storage_bloc.dart';

abstract class GetEmployeeListFromLocalStorageState extends Equatable {
  const GetEmployeeListFromLocalStorageState();

  @override
  List<Object> get props => [];
}

class GetEmployeeListFromLocalStorageInitial
    extends GetEmployeeListFromLocalStorageState {}

class EmployeeListFromLocalStorageLoading
    extends GetEmployeeListFromLocalStorageState {}

class EmployeeListFromLocalStorageLoaded
    extends GetEmployeeListFromLocalStorageState {
  List<EmployeeDetails> employeeList = [];
  @override
  List<Object> get props => [employeeList];
  EmployeeListFromLocalStorageLoaded({required this.employeeList});
}

class EmployeeListFromLocalStorageError
    extends GetEmployeeListFromLocalStorageState {
  late String e;
  @override
  List<Object> get props => [e];
  EmployeeListFromLocalStorageError({required this.e});
}
