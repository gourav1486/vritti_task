import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vritti_task/business_logic/data/model/employee_model.dart';

part 'show_details_bloc_event.dart';
part 'show_details_bloc_state.dart';

class ShowDetailsBlocBloc
    extends Bloc<ShowDetailsBlocEvent, ShowDetailsBlocState> {
  ShowDetailsBlocBloc() : super(ShowDetailsBlocInitial()) {
    on<OnTap>((event, emit) {
      // TODO: implement event handler
      emit(ShowDetals(details: event.details));
    });
  }
}
