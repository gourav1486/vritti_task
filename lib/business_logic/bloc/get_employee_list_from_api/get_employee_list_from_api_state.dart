part of 'get_employee_list_from_api_bloc.dart';

@immutable
abstract class GetEmployeeListFromApiState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetEmployeeListFromApiInitial extends GetEmployeeListFromApiState {}

class EmployeeListFromApiLoading extends GetEmployeeListFromApiState {
  @override
  List<Object> get props => [];
}

class EmployeeListFromApiLoaded extends GetEmployeeListFromApiState {
  late EmployeeModel employeeList;
  @override
  List<Object> get props => [employeeList];
  EmployeeListFromApiLoaded();
}

class EmployeeListFromApiError extends GetEmployeeListFromApiState {
  late String e;
  @override
  List<Object> get props => [e];
  EmployeeListFromApiError({required this.e});
}
