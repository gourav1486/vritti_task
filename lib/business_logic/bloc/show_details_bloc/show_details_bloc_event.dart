part of 'show_details_bloc_bloc.dart';

abstract class ShowDetailsBlocEvent extends Equatable {
  const ShowDetailsBlocEvent();

  @override
  List<Object> get props => [];
}

class OnTap extends ShowDetailsBlocEvent {
  late EmployeeDetails details;
  OnTap({required this.details});
}
