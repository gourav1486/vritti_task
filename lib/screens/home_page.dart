import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vritti_task/business_logic/bloc/get_employee_data_from_local_storage/get_employee_list_from_local_storage_bloc.dart';
import 'package:vritti_task/business_logic/bloc/get_employee_list_from_api/get_employee_list_from_api_bloc.dart';
import 'package:vritti_task/business_logic/bloc/show_details_bloc/show_details_bloc_bloc.dart';
import 'package:vritti_task/business_logic/data/repository/get_employee_list_from_local_storage.dart';
import 'package:vritti_task/widgets/app_bar.dart';
import 'package:vritti_task/widgets/details_view.dart';
import 'package:vritti_task/widgets/tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetEmployeeListFromApiBloc>(context)
        .add(GetEmployeeListFromApi());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<GetEmployeeListFromApiBloc, GetEmployeeListFromApiState>(
        builder: (context, state) {
          if (state is EmployeeListFromApiLoaded) {
            BlocProvider.of<GetEmployeeListFromLocalStorageBloc>(context)
                .add(LoadEmployeeListFromLocalStorage());
          }
          return state is EmployeeListFromApiLoaded
              ? Column(
                  children: [
                    CustomAppBar(
                      onRefreshPressd: () =>
                          BlocProvider.of<GetEmployeeListFromApiBloc>(context)
                              .add(GetEmployeeListFromApi()),
                    ), //App Bar
                    BlocBuilder<GetEmployeeListFromLocalStorageBloc,
                        GetEmployeeListFromLocalStorageState>(
                      builder: (context, state) {
                        if (state is EmployeeListFromLocalStorageLoaded &&
                            state.employeeList.length > 0) {
                          BlocProvider.of<ShowDetailsBlocBloc>(context)
                              .add(OnTap(details: state.employeeList[0]));
                        }
                        return state is EmployeeListFromLocalStorageLoaded
                            ? Container(
                                height: 160,
                                width: MediaQuery.of(context).size.width,
                                child: state.employeeList.length == 0
                                    ? Center(
                                        child: Text(
                                          'Employees Not Found',
                                          style:
                                              GoogleFonts.poppins(fontSize: 20),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: state.employeeList.length,
                                        itemBuilder: (context, index) {
                                          var details =
                                              state.employeeList[index];
                                          return TabView(
                                            details: details,
                                            onTap: () => BlocProvider.of<
                                                        ShowDetailsBlocBloc>(
                                                    context)
                                                .add(OnTap(details: details)),
                                          );
                                        }),
                              )
                            : state is EmployeeListFromLocalStorageError
                                ? Center(
                                    child: Text(state.e),
                                  )
                                : CircularProgressIndicator();
                      },
                    ), //Tab View
                    BlocBuilder<ShowDetailsBlocBloc, ShowDetailsBlocState>(
                      builder: (context, state) {
                        return state is ShowDetals
                            ? DetailsView(
                                details: state.details,
                              )
                            : SizedBox.shrink();
                      },
                    ) //Details View
                  ],
                )
              : state is EmployeeListFromApiError
                  ? Center(
                      child: Text(state.e, style: GoogleFonts.poppins()),
                    )
                  : Center(child: CircularProgressIndicator());
        },
      ),
      backgroundColor: Color(0xffffe8edd4),
    );
  }
}
