part of 'get_employee_list_from_local_storage_bloc.dart';

abstract class GetEmployeeListFromLocalStorageEvent extends Equatable {
  const GetEmployeeListFromLocalStorageEvent();

  @override
  List<Object> get props => [];
}

class LoadEmployeeListFromLocalStorage
    extends GetEmployeeListFromLocalStorageEvent {
  @override
  List<Object> get props => [];
  LoadEmployeeListFromLocalStorage();
}
