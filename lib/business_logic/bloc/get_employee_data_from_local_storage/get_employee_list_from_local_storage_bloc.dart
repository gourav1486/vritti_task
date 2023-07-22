import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vritti_task/business_logic/bloc/get_employee_list_from_api/get_employee_list_from_api_bloc.dart';
import 'package:vritti_task/business_logic/data/model/employee_model.dart';
import 'package:vritti_task/business_logic/data/repository/get_employee_list_from_local_storage.dart';

part 'get_employee_list_from_local_storage_event.dart';
part 'get_employee_list_from_local_storage_state.dart';

class GetEmployeeListFromLocalStorageBloc extends Bloc<
    GetEmployeeListFromLocalStorageEvent,
    GetEmployeeListFromLocalStorageState> {
  var getDataFromLocalStorageRepo = GetEmployeeDetailsFromLocalStorage();
  List<EmployeeDetails> empDetails = [];
  GetEmployeeListFromLocalStorageBloc()
      : super(GetEmployeeListFromLocalStorageInitial()) {
    on<LoadEmployeeListFromLocalStorage>((event, emit) async {
      emit(EmployeeListFromLocalStorageLoading());
      try {
        empDetails =
            await getDataFromLocalStorageRepo.getEmployeeListFromLocalStorage();
      
        emit(EmployeeListFromLocalStorageLoaded(employeeList: empDetails));
      } catch (e) {
        emit(EmployeeListFromLocalStorageError(e: e.toString()));
      }
    });
  }
}
