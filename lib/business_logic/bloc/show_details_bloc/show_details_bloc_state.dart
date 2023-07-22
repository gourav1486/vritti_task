part of 'show_details_bloc_bloc.dart';

abstract class ShowDetailsBlocState extends Equatable {
  const ShowDetailsBlocState();

  @override
  List<Object> get props => [];
}

class ShowDetailsBlocInitial extends ShowDetailsBlocState {}

class ShowDetals extends ShowDetailsBlocState {
  late EmployeeDetails details;
  @override
  List<Object> get props => [details];
  ShowDetals({required this.details});
}
