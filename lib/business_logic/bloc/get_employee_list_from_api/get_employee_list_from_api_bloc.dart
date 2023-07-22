

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:vritti_task/business_logic/data/model/employee_model.dart';
import 'package:vritti_task/business_logic/data/repository/get_employee_details_repository.dart';

part 'get_employee_list_from_api_event.dart';
part 'get_employee_list_from_api_state.dart';

class GetEmployeeListFromApiBloc
    extends Bloc<GetEmployeeListFromApiEvent, GetEmployeeListFromApiState> {
  var employeeDetailsFromApi = GetEmployeeDetailsRepository();
  GetEmployeeListFromApiBloc() : super(GetEmployeeListFromApiInitial()) {
    on<GetEmployeeListFromApi>((event, emit) async {
      emit(EmployeeListFromApiLoading());
      try {
       await employeeDetailsFromApi.getEmployeeDetails();
       
        emit(EmployeeListFromApiLoaded());
      } catch (e) {
        emit(EmployeeListFromApiError(e: e.toString()));
      }
    });
  }
}
