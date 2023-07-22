part of 'get_employee_list_from_api_bloc.dart';

@immutable
abstract class GetEmployeeListFromApiEvent extends Equatable {
  const GetEmployeeListFromApiEvent();
  @override
  List<Object> get props => [];
}

class GetEmployeeListFromApi extends GetEmployeeListFromApiEvent {
  @override
  List<Object> get props => [];
  const GetEmployeeListFromApi();
}
